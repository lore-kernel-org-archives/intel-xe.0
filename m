Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A8EE0AE9
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 15:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70410E27E;
	Sat,  7 Feb 2026 15:42:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D830710E0CC;
 Sat,  7 Feb 2026 15:42:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8351917049506265719=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/vf=3A_Fix_exec_queu?=
 =?utf-8?q?e_creation_during_post-migration_recovery?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Feb 2026 15:42:25 -0000
Message-ID: <177047894585.235304.1481829405402085109@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206145334.674679-1-tomasz.lis@intel.com>
In-Reply-To: <20260206145334.674679-1-tomasz.lis@intel.com>
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

--===============8351917049506265719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fix exec queue creation during post-migration recovery
URL   : https://patchwork.freedesktop.org/series/161287/
State : failure

== Summary ==

CI Bug Log - changes from xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04_FULL -> xe-pw-161287v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161287v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161287v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161287v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@queue-idle@pipe-d-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_sequence@queue-idle@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_sequence@queue-idle@pipe-d-dp-2.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html

  
Known issues
------------

  Here are the changes found in xe-pw-161287v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2233])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7059])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7059])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2328]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#607])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +26 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +20 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2724])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2325])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][29] ([Intel XE#6968]) +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-edp-1.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6969]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-3.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6969] / [Intel XE#7006])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2390] / [Intel XE#6974])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6974])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178] / [Intel XE#3304]) +4 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#3304]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2341])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#6707])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2291]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2286])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4210])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1340]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#4354])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4294])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4331])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2316]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][53] -> [INCOMPLETE][54] ([Intel XE#6906]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][55] -> [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7178])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7178]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#6312]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +39 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7061])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7061]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4141]) +18 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2312]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2313]) +31 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1470])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#3374] / [Intel XE#3544])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7086])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6911])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2501])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2486])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7130]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7131]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7111] / [Intel XE#7131]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7130]) +33 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7111] / [Intel XE#7130]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2393])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#4596])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6886]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#870])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3309])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#718]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2392])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#1489]) +10 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2893])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2330])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#1435])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#6503]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2450])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2168])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#1499])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1499])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1499]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][105] -> [ABORT][106] ([Intel XE#7169]) +1 other test abort
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#6599])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-vms:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#4837])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4837]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4837] / [Intel XE#6665]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4837] / [Intel XE#6665])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#5793])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7140]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#688])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2322]) +13 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1392]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#7136]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#7136]) +13 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#6874]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6874]) +40 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:
    - shard-bmg:          [PASS][121] -> [ABORT][122] ([Intel XE#7169])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4943]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4943]) +28 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_exec_threads@threads-many-queues:
    - shard-bmg:          NOTRUN -> [FAIL][125] ([Intel XE#7166])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_exec_threads@threads-many-queues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#7138]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#7138]) +12 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2229])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153]) -> ([PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [SKIP][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179]) ([Intel XE#2457])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#6964]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#6964]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#2248])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2248])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#1420])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2284])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#584])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#4733]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#944])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#944]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#3342])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@shared-pde-page:
    - shard-bmg:          [PASS][191] -> [DMESG-WARN][192] ([Intel XE#3428])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_vm@shared-pde-page.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_vm@shared-pde-page.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][193] ([Intel XE#5993]) -> [PASS][194] +3 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [DMESG-WARN][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][197] ([Intel XE#2291]) -> [PASS][198] +4 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][199] ([Intel XE#4302]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][201] ([Intel XE#2316]) -> [PASS][202] +3 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][203] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3428] / [Intel XE#5208]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][207] ([Intel XE#1503]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [SKIP][209] ([Intel XE#7197]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-bmg:          [INCOMPLETE][211] -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@kms_universal_plane@universal-plane-functional.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_universal_plane@universal-plane-functional.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][213] ([Intel XE#4227]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_vrr@flipline.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][215] ([Intel XE#2142]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#6321]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-bmg:          [ABORT][219] ([Intel XE#7169]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_exec_balancer@once-cm-parallel-userptr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [ABORT][221] -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][223] ([Intel XE#2341]) -> [FAIL][224] ([Intel XE#1178] / [Intel XE#3304])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_content_protection@atomic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][225] ([Intel XE#2341]) -> [FAIL][226] ([Intel XE#6707])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_content_protection@uevent.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][227] ([Intel XE#6707]) -> [SKIP][228] ([Intel XE#7194])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][229] ([Intel XE#4633]) -> [FAIL][230] ([Intel XE#5299])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [ABORT][231] ([Intel XE#5545] / [Intel XE#6652]) -> [SKIP][232] ([Intel XE#2316])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][233] ([Intel XE#2311]) -> [SKIP][234] ([Intel XE#2312]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][235] ([Intel XE#4141]) -> [SKIP][236] ([Intel XE#2312]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][237] ([Intel XE#2312]) -> [SKIP][238] ([Intel XE#4141]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#2312]) -> [SKIP][240] ([Intel XE#2311]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][241] ([Intel XE#2312]) -> [SKIP][242] ([Intel XE#2313]) +12 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][243] ([Intel XE#2313]) -> [SKIP][244] ([Intel XE#2312]) +8 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][245] ([Intel XE#4596]) -> [SKIP][246] ([Intel XE#5021])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][247] ([Intel XE#2426]) -> [SKIP][248] ([Intel XE#2509])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][249] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][250] ([Intel XE#5466])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6906
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166
  [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7197]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7197
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8740 -> IGT_8741
  * Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -> xe-pw-161287v1

  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8741: 8741
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c3629013dde27929dbf04
  xe-pw-161287v1: 161287v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/index.html

--===============8351917049506265719==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fix exec queue creation during po=
st-migration recovery</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161287/">https://patchwork.freedesktop.org/series/161287/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161287v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161287v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4519-d9124a6be3c7bdaeb14c3629013dde279=
29dbf04_FULL -&gt; xe-pw-161287v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161287v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-161287v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1612=
87v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_sequence@queue-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_sequ=
ence@queue-idle@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_sequence@queu=
e-idle@pipe-d-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-8/igt@xe_ccs@s=
uspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-=
lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.ht=
ml">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_exec_=
threads@threads-hang-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-=
bmg-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.ht=
ml">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@xe_fault=
_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/s=
hard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_crea=
te_bind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161287v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_color_pipeline@plane-ctm3=
x4-lut1d@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6968">Intel XE#6968</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_content_protection@lic-t=
ype-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_dp_link_training@non-uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6906">Intel XE#6906</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_flip@flip-vs-s=
uspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +39 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +18 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_joiner@basic-force-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7086">Intel XE#7086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7=
130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
31">Intel XE#7131</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#=
7131</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#=
7111</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
131">Intel XE#7131</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +33 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#=
7130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-2/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_psr@pr-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">In=
tel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-5/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-8/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-=
lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7169">Intel XE#7169</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@xe_eudebug@basic-vms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837=
">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_eudebug@vma-ufence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_eudebug_online@pagefault-w=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_evict@evict-small-multi-q=
ueue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7140">Intel XE#7140</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-mult=
i-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7136">Intel XE#7136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +40 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_exec_=
system_allocator@many-execqueues-mmap-prefetch-shared.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-b=
mg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch-shared.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7169">Intel XE#7169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +28 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-many-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_exec_threads@threads-many=
-queues.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7166">Intel XE#7166</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-cm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929d=
bf04/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27=
929dbf04/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013d=
de27929dbf04/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629=
013dde27929dbf04/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c=
3629013dde27929dbf04/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdae=
b14c3629013dde27929dbf04/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7=
bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6=
be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9=
124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-45=
19-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161287v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61287v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161287v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161287v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161287v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161287v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161287v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-coherenc=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-=
prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-7/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161287v1/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde-page:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@xe_vm@sh=
ared-pde-page.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-161287v1/shard-bmg-3/igt@xe_vm@shared-pde-page.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3428">Intel XE#3428</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1=
/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-1-displays-1920x1080p.html">DMESG-WARN</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-=
8/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/sh=
ard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1612=
87v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1612=
87v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_pm_r=
pm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7197">Intel XE#7197</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-8/igt@kms_pm_rpm@=
universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-8/igt@kms_univ=
ersal_plane@universal-plane-functional.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/ig=
t@kms_universal_plane@universal-plane-functional.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-1/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161287v1/shard-lnl-2/igt@kms_vrr@flipline.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-l=
nl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shar=
d-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-10/igt@xe_exec=
_balancer@once-cm-parallel-userptr.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8=
/igt@xe_exec_balancer@once-cm-parallel-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@xe_fault=
_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-=
8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-8/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_cont=
ent_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-6/igt@km=
s_content_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/s=
hard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161287v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1287v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61287v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1287v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/shard-bmg-9/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v1/sha=
rd-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509"=
>Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-4/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Inte=
l XE#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-161287v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8740 -&gt; IGT_8741</li>
<li>Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -&gt; xe-pw-161=
287v1</li>
</ul>
<p>IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8741: 8741<br />
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c362=
9013dde27929dbf04<br />
  xe-pw-161287v1: 161287v1</p>

</body>
</html>

--===============8351917049506265719==--
