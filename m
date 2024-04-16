Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE0FC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 07:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47911112AC8;
	Tue, 16 Apr 2024 07:41:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763FE112AB8;
 Tue, 16 Apr 2024 07:41:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2251880721049111873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe/irq=3A_Remove_unnecessar?=
 =?utf-8?q?y_semicolon_in_pick=5Fengine=5Fgt=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jiapeng Chong" <jiapeng.chong@linux.alibaba.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 07:41:25 -0000
Message-ID: <171325328546.1424598.3329928426334930842@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
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

--===============2251880721049111873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/irq: Remove unnecessary semicolon in pick_engine_gt()
URL   : https://patchwork.freedesktop.org/series/132425/
State : success

== Summary ==

CI Bug Log - changes from xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343_full -> xe-pw-132425v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132425v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_cursor@overlay:
    - {shard-lnl}:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@kms_plane_cursor@overlay.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-4/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - {shard-lnl}:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html

  * igt@kms_properties@connector-properties-legacy:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-8/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - {shard-lnl}:        [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-180.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-180.html

  
Known issues
------------

  Here are the changes found in xe-pw-132425v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1125] / [Intel XE#1201])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][9] ([Intel XE#1033] / [Intel XE#358]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#873])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#607])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#610]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1231]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#619])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#610])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +56 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +96 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#1252])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#650]) +51 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +37 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#1252])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#307])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455]) +23 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#308])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#323])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][48] ([Intel XE#1214]) +7 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#310]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][50] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][51] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#324]) +2 other tests dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][54] -> [FAIL][55] ([Intel XE#616]) +3 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [i915#5274])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1151] / [Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#656]) +39 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#616]) +12 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#324])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#870])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1122] / [Intel XE#1201])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1129] / [Intel XE#1201])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#1211])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#836])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1122] / [Intel XE#1201])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][82] ([Intel XE#616]) +10 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][83] ([Intel XE#1214] / [Intel XE#324])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#327])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#327])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#330])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#756])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#756])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1091] / [Intel XE#1201])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:
    - shard-adlp:         NOTRUN -> [FAIL][90] ([Intel XE#1080]) +9 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1123] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1473])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#688])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][101] ([Intel XE#1214] / [Intel XE#358])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][102] -> [TIMEOUT][103] ([Intel XE#1206] / [Intel XE#1356])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][104] -> [TIMEOUT][105] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#1081])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#378])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#979])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#1173]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#366])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][112] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#366]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#579])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][117] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][119] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][120] +6 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-b.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][123] ([Intel XE#1200] / [Intel XE#1214]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - {shard-lnl}:        [DMESG-WARN][125] ([Intel XE#1330]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][127] ([Intel XE#616]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     [ABORT][129] ([Intel XE#1553]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#1553]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [FAIL][133] ([Intel XE#1203]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_pm_rpm@basic-rte.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_pm_rpm@basic-rte.html
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#1203]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_pm_rpm@basic-rte.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [SKIP][137] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - {shard-lnl}:        [SKIP][141] ([Intel XE#1211]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#771] / [Intel XE#899]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][145] ([Intel XE#899]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#1214] / [Intel XE#1608]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#1259]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][153] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [WARN][157] -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [WARN][159] -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][161] ([Intel XE#1440]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-3/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][163] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [DMESG-WARN][164] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][166] ([Intel XE#1033] / [Intel XE#1214])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][168] ([Intel XE#1178])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_content_protection@atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#1204]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#455])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][172] ([Intel XE#1214] / [Intel XE#282])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#282])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@single-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][175] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][176] ([Intel XE#1191] / [Intel XE#1214])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][178] ([Intel XE#1214] / [Intel XE#1608])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-FAIL][179] ([Intel XE#324]) -> [DMESG-WARN][180] ([Intel XE#1214] / [Intel XE#324])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [INCOMPLETE][181] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][182] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][183] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][184] ([Intel XE#1191] / [Intel XE#1214])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][186] ([Intel XE#1191] / [Intel XE#1214])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][187] ([Intel XE#821]) -> [FAIL][188] ([Intel XE#1041])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][192] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) +1 other test incomplete
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1495]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343 -> xe-pw-132425v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343: 4369453e15db818bdf6f1fd5a586a1a45575a343
  xe-pw-132425v1: 132425v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/index.html

--===============2251880721049111873==
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
<tr><td><b>Series:</b></td><td>drm/xe/irq: Remove unnecessary semicolon in pick_engine_gt()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132425/">https://patchwork.freedesktop.org/series/132425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343_full -&gt; xe-pw-132425v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132425v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-4/igt@kms_plane_cursor@overlay.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-8/igt@kms_properties@connector-properties-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-180.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132425v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +51 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200">Intel XE#1200</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-lnl-3/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132425v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343 -&gt; xe-pw-132425v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1090-4369453e15db818bdf6f1fd5a586a1a45575a343: 4369453e15db818bdf6f1fd5a586a1a45575a343<br />
  xe-pw-132425v1: 132425v1</p>

</body>
</html>

--===============2251880721049111873==--
