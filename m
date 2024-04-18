Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4595FC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74E9113F6B;
	Thu, 18 Apr 2024 19:44:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3063113F6B;
 Thu, 18 Apr 2024 19:44:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7561830057578206156=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Modify_minimum_of_var?=
 =?utf-8?q?ious_scheduler_timeout_to_0=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 19:44:08 -0000
Message-ID: <171346944865.1502081.3657841986679342539@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
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

--===============7561830057578206156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Modify minimum of various scheduler timeout to 0. (rev5)
URL   : https://patchwork.freedesktop.org/series/130913/
State : failure

== Summary ==

CI Bug Log - changes from xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4_full -> xe-pw-130913v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130913v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130913v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130913v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-adlp:         [PASS][2] -> [DMESG-FAIL][3] +8 other tests dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286:
    - shard-adlp:         [PASS][4] -> [FAIL][5] +135 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-6/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286.html

  * igt@xe_vm@large-split-binds-33554432:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_vm@large-split-binds-33554432.html

  
Known issues
------------

  Here are the changes found in xe-pw-130913v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#650]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1185] / [Intel XE#1201]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][9] ([Intel XE#1033] / [Intel XE#358]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_async_flips@crc.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][13] -> [FAIL][14] ([Intel XE#1231])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][15] ([Intel XE#1204]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1231])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#1088] / [Intel XE#1330])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#346])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +89 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +59 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#307])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1204]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +23 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#776])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#310]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][47] -> [DMESG-WARN][48] ([Intel XE#1162] / [Intel XE#1214])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1214]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][51] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#422] / [Intel XE#616]) +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][54] ([Intel XE#324]) +3 other tests dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][55] ([Intel XE#1214]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1201] / [Intel XE#1226])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1151] / [Intel XE#1201])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#656]) +50 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#605])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [PASS][65] -> [SKIP][66] ([Intel XE#1201] / [Intel XE#417])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][67] ([Intel XE#1191] / [Intel XE#1214]) +8 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-64:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][68] ([Intel XE#1195]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#324])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#361])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1129] / [Intel XE#1201])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#1203])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@kms_pm_rpm@basic-rte.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][80] -> [SKIP][81] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#836])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#1201] / [Intel XE#1211])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#929]) +18 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1149] / [Intel XE#1201])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#616]) +12 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#324])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#327])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][93] -> [FAIL][94] ([Intel XE#771] / [Intel XE#899])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][95] -> [FAIL][96] ([Intel XE#899])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][97] -> [FAIL][98] ([Intel XE#899])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-adlp:         NOTRUN -> [FAIL][99] ([Intel XE#1080]) +9 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [PASS][101] -> [FAIL][102] ([Intel XE#1050])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1123] / [Intel XE#1201])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1062] / [Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][105] -> [TIMEOUT][106] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     NOTRUN -> [ABORT][108] ([Intel XE#1304])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#1259])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][112] -> [TIMEOUT][113] ([Intel XE#1473] / [Intel XE#392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-adlp:         NOTRUN -> [FAIL][115] ([Intel XE#1069])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-adlp:         [PASS][116] -> [DMESG-FAIL][117] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#1392]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         [PASS][119] -> [FAIL][120] ([Intel XE#1069])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [PASS][123] -> [TIMEOUT][124] ([Intel XE#1261] / [Intel XE#1356])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - shard-adlp:         [PASS][125] -> [INCOMPLETE][126] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1330])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [PASS][127] -> [FAIL][128] ([Intel XE#1256])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-adlp:         [PASS][129] -> [SKIP][130] ([Intel XE#1192] / [Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1008] / [Intel XE#1201])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#378])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_module_load@load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][133] -> [ABORT][134] ([Intel XE#1205] / [Intel XE#1216])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_module_load@unload.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@xe_module_load@unload.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#977])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [FAIL][136] ([Intel XE#355])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         NOTRUN -> [FAIL][138] ([Intel XE#1257])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][139] -> [DMESG-WARN][140] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [FAIL][141] ([Intel XE#1043] / [Intel XE#845])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_query@query-cs-cycles:
    - shard-adlp:         [PASS][144] -> [INCOMPLETE][145] ([Intel XE#1195])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-6/igt@xe_query@query-cs-cycles.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_query@query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [i915#6077]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][149] +3 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][150] ([Intel XE#1231]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#1088] / [Intel XE#1330]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][155] +4 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][162] ([Intel XE#1195] / [Intel XE#927]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][164] ([Intel XE#616]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-adlp:         [SKIP][166] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_plane@plane-position-hole.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-adlp:         [INCOMPLETE][168] ([Intel XE#1195]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#361]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201]) -> [PASS][175] +7 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_rmfb@rmfb-ioctl.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][176] ([Intel XE#899]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-idle:
    - shard-adlp:         [SKIP][178] ([Intel XE#1201]) -> [PASS][179] +5 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_vblank@ts-continuation-idle.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][180] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][182] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue:
    - shard-adlp:         [DMESG-FAIL][184] -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_exec_basic@many-execqueues-bindexecqueue.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-adlp:         [INCOMPLETE][186] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_threads@threads-bal-fd-basic:
    - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-basic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-basic.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-dg2-set2:     [TIMEOUT][190] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-basic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-basic.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-adlp:         [FAIL][192] ([Intel XE#355]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@xe_pm@d3hot-multiple-execs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][194] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s3-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_pm@s3-basic.html

  * igt@xe_vm@large-split-misaligned-binds-2147483648:
    - shard-dg2-set2:     [DMESG-WARN][196] ([Intel XE#1214]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@xe_vm@large-split-misaligned-binds-2147483648.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@xe_vm@large-split-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#316])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][200] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][201] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][202] ([Intel XE#324]) -> [FAIL][203] ([Intel XE#1231]) +1 other test fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][204] ([Intel XE#1231]) -> [DMESG-FAIL][205] ([Intel XE#324])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][207] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#367])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#367])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
    - shard-adlp:         [SKIP][214] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#306])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
    - shard-adlp:         [SKIP][218] ([Intel XE#1201]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#306])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_chamelium_color@ctm-0-75.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#1226])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#373])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-adlp:         [SKIP][224] ([Intel XE#1201]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#373])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][227] ([Intel XE#1188])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_content_protection@uevent.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201]) -> [DMESG-WARN][229] ([Intel XE#1214] / [Intel XE#282])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#455])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][232] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][233] ([Intel XE#1195] / [Intel XE#927])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][234] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][235] ([Intel XE#1195])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#323])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         [SKIP][238] ([Intel XE#1201]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#323])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [INCOMPLETE][240] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][241] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][242] ([Intel XE#1195]) -> [DMESG-WARN][243] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         [SKIP][246] ([Intel XE#1201]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][248] ([Intel XE#1201]) -> [INCOMPLETE][249] ([Intel XE#1195])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         [SKIP][252] ([Intel XE#1201]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][256] ([Intel XE#1201]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][260] ([Intel XE#616]) -> [DMESG-FAIL][261] ([Intel XE#1162]) +1 other test dmesg-fail
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-FAIL][262] ([Intel XE#324]) -> [DMESG-WARN][263] ([Intel XE#1214] / [Intel XE#324])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#455])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
    - shard-adlp:         [SKIP][266] ([Intel XE#1201] / [Intel XE#829]) -> [FAIL][267] ([Intel XE#616]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_plane_lowres@tiling-y.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][268] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][269] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][270] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][271] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#870])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#1235]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#929])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-blt:
    - shard-adlp:         [SKIP][278] ([Intel XE#1201]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_psr@psr-primary-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_psr@psr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#327])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-adlp:         [SKIP][282] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#327])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         [SKIP][284] ([Intel XE#1201]) -> [SKIP][285] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][286] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][287] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][289] ([Intel XE#1034] / [Intel XE#1195])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][290] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][291] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][292] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][293] ([Intel XE#1214] / [Intel XE#1608])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][295] ([Intel XE#1162])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7809 -> IGT_7810
  * Linux: xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4 -> xe-pw-130913v5

  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4: c577180c5a61220ef8db9a4a3cd4de66bf58eed4
  xe-pw-130913v5: 130913v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/index.html

--===============7561830057578206156==
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
<tr><td><b>Series:</b></td><td>drm/xe: Modify minimum of various scheduler timeout to 0. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130913/">https://patchwork.freedesktop.org/series/130913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4_full -&gt; xe-pw-130913v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130913v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130913v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130913v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html">DMESG-FAIL</a> +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-6/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-system-system-286x286.html">FAIL</a> +135 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-33554432:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_vm@large-split-binds-33554432.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130913v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185">Intel XE#1185</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-64.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@sriov_basic@bind-unbind-vf@vf-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_evict@evict-mixed-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@xe_module_load@unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_pm@s3-exec-after.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-cs-cycles:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-6/igt@xe_query@query-cs-cycles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_query@query-cs-cycles.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_plane@plane-position-hole.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_vblank@ts-continuation-idle.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@xe_exec_basic@many-execqueues-bindexecqueue.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@xe_pm@d3hot-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-463/igt@xe_vm@large-split-misaligned-binds-2147483648.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@xe_vm@large-split-misaligned-binds-2147483648.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-8/igt@kms_plane_lowres@tiling-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v5/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7809 -&gt; IGT_7810</li>
<li>Linux: xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4 -&gt; xe-pw-130913v5</li>
</ul>
<p>IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4: c577180c5a61220ef8db9a4a3cd4de66bf58eed4<br />
  xe-pw-130913v5: 130913v5</p>

</body>
</html>

--===============7561830057578206156==--
