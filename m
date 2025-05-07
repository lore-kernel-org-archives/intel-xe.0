Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C98BC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 12:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80E910E79F;
	Wed,  7 May 2025 12:36:25 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAF310E79C;
 Wed,  7 May 2025 12:36:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7211079771388314763=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe2hpg=3A_Add_Wa=5F?=
 =?utf-8?q?22021007897_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 12:36:25 -0000
Message-ID: <174662138562.55006.10156344592184635538@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250507101112.4678-1-aradhya.bhatia@intel.com>
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

--===============7211079771388314763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2hpg: Add Wa_22021007897 (rev2)
URL   : https://patchwork.freedesktop.org/series/148672/
State : failure

== Summary ==

CI Bug Log - changes from xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4_FULL -> xe-pw-148672v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148672v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148672v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148672v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +9 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@static-swap.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@xe_exec_capture@reset:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exec_capture@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_exec_capture@reset.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-148672v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#4208] / [Intel XE#4618])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3884])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]) +2 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#619])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +111 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2341])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@async-cursor-crc-position-change:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2320])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_cursor_crc@async-cursor-crc-position-change.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_cursor_crc@async-cursor-crc-position-change.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2375])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3321]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#310]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#301]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#301]) +5 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#2882]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#2882]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +13 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4141]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#651]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +14 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#653])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2350])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2502])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4883])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#3012])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4173]) +2 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#616])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2393])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#4596])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2571])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2763]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][81] -> [FAIL][82] ([Intel XE#718])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2505])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1489]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1489]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2850] / [Intel XE#929])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2939])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#3414])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2413])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#1729])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#330])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#4488]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#4459]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#756]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4837]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4518])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-bmg:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1473] / [Intel XE#3428])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2322]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#288])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-new-busy:
    - shard-bmg:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#3428]) +5 other tests dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-new-busy.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-new-busy.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4915]) +30 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#4937])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4045])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2284])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#366])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][120] -> [ABORT][121] ([Intel XE#1794])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][122] -> [ABORT][123] ([Intel XE#1794]) +1 other test abort
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][124] -> [FAIL][125] ([Intel XE#4817]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4733])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#4208]) +26 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#4543]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#301]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][135] ([Intel XE#3321]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][137] ([Intel XE#2316]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][139] ([Intel XE#301]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][141] ([Intel XE#2883]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][143] ([Intel XE#1435]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@testdisplay:
    - shard-bmg:          [DMESG-WARN][145] ([Intel XE#3428]) -> [PASS][146] +6 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@testdisplay.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@testdisplay.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1392]) -> [PASS][148] +5 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#4173]) -> [PASS][150] +8 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][151] ([Intel XE#1794]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][153] ([Intel XE#1794]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1124]) -> [SKIP][156] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2191]) -> [SKIP][158] ([Intel XE#4208] / [i915#2575])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2907]) -> [SKIP][160] ([Intel XE#4208]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][162] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#306]) -> [SKIP][164] ([Intel XE#4208] / [i915#2575])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#373]) -> [SKIP][166] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [TIMEOUT][167] ([Intel XE#4862]) -> [FAIL][168] ([Intel XE#1178]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_content_protection@atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#307]) -> [SKIP][170] ([Intel XE#4208] / [i915#2575])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][171] ([Intel XE#1178]) -> [SKIP][172] ([Intel XE#2341])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#455]) -> [SKIP][174] ([Intel XE#4208])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#4141]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#4141]) -> [SKIP][178] ([Intel XE#2312]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#651]) -> [SKIP][180] ([Intel XE#4208])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][181] ([Intel XE#2311]) -> [SKIP][182] ([Intel XE#2312]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2311]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#2313]) -> [SKIP][186] ([Intel XE#2312]) +8 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#653]) -> [SKIP][188] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2313]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#4208]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][193] ([Intel XE#3544]) -> [SKIP][194] ([Intel XE#3374] / [Intel XE#3544])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][195] ([Intel XE#2493]) -> [SKIP][196] ([Intel XE#4596])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#870]) -> [SKIP][198] ([Intel XE#4208])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1129]) -> [SKIP][200] ([Intel XE#2351] / [Intel XE#4208])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1489]) -> [SKIP][202] ([Intel XE#4208]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][204] ([Intel XE#4208]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][205] ([Intel XE#2509]) -> [SKIP][206] ([Intel XE#2426])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1126]) -> [SKIP][208] ([Intel XE#4208])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4837]) -> [SKIP][210] ([Intel XE#4208])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_eudebug_online@tdctl-parameters.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#288]) -> [SKIP][212] ([Intel XE#4208]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#4915]) -> [SKIP][214] ([Intel XE#4208]) +17 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4501]) -> [SKIP][216] ([Intel XE#4208])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@buffer-size.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_oa@buffer-size.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][218] ([Intel XE#4208])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4814]) -> [SKIP][220] ([Intel XE#4208])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862
  [Intel XE#4883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4 -> xe-pw-148672v2

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4: b5600d5671f0e468c0c73bc7a1de942097ddaab4
  xe-pw-148672v2: 148672v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/index.html

--===============7211079771388314763==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2hpg: Add Wa_22021007897 (rev2)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148672/">https://patchwork.freedesktop.org/series/148672/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148672v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148672v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3044-b5600d5671f0e468c0c73bc7a1de94209=
7ddaab4_FULL -&gt; xe-pw-148672v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148672v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148672v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1486=
72v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a=
> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_exec_capture@reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exe=
c_capture@reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_exec_capture@reset.html"=
>FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exe=
c_threads@threads-cm-fd-userptr-rebind.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@xe_e=
xec_threads@threads-cm-fd-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148672v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@i=
ntel_sysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Inte=
l XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-8/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/sha=
rd-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-ti=
led-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_content_protection@atom=
ic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@async-cursor-crc-position-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_curs=
or_crc@async-cursor-crc-position-change.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_c=
ursor_crc@async-cursor-crc-position-change.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_cursor_c=
rc@cursor-sliding-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard=
-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-4/i=
gt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2=
882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@k=
ms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_hdr@=
bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4883">Intel XE#4883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_multiple@2x-tiling=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_vbla=
nk@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_vblank@ts=
-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-7/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148672v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug@discovery-race-vmb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@xe_evict=
@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@xe_evict@evict-ben=
g-small-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-r=
ace.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148672v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-large-new-busy.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/ig=
t@xe_exec_system_allocator@process-many-large-new-busy.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Inte=
l XE#3428</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +30 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148672v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-p=
agesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-3/igt@xe_pm@s4=
-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148672v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817"=
>Intel XE#4817</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_vm@=
munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/=
igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +26 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148672v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-=
dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148672v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
d-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-=
bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@testdisp=
lay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@testdisplay.html">PAS=
S</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg=
2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-3/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_pm@s4-basic-e=
xec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s4-vm-=
bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard=
-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ch=
amelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-46=
4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4862">Intel XE#4862</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148672v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to=
-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
72v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
72v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8672v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
672v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#6=
53</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_p=
m_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
72v2/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ps=
r@fbc-psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@=
kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_eud=
ebug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@=
xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-=
dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exe=
c_system_allocator@threads-many-new-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
72v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-new-race-nomem=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@=
syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1486=
72v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4 -&gt; xe-pw-148=
672v2</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4: b5600d5671f0e468c0c73bc=
7a1de942097ddaab4<br />
  xe-pw-148672v2: 148672v2</p>

</body>
</html>

--===============7211079771388314763==--
