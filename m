Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E3FC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 12:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6541010E4F5;
	Mon, 27 Jan 2025 12:24:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336D10E4F5;
 Mon, 27 Jan 2025 12:24:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7399119453692533289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Enable_Survivability_mode_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jan 2025 12:24:40 -0000
Message-ID: <173798068069.1386903.4740199126748916711@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127080716.643697-1-riana.tauro@intel.com>
In-Reply-To: <20250127080716.643697-1-riana.tauro@intel.com>
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

--===============7399119453692533289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Survivability mode (rev5)
URL   : https://patchwork.freedesktop.org/series/142464/
State : failure

== Summary ==

CI Bug Log - changes from xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8_full -> xe-pw-142464v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142464v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142464v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142464v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_sequence@queue-idle.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-4/igt@kms_sequence@queue-idle.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] +3 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  
#### Warnings ####

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][8] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-142464v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2423])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_getstats.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3249])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@core_getversion@all-cards.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][14] -> [FAIL][15] ([Intel XE#3440])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_getversion@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#3249])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#3453])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#3249])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2423])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_setmaster_vs_auth.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2134]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@fbdev@info.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2134]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@fbdev@nullptr.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][28] ([Intel XE#1033]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2136]) +50 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2136]) +36 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#316])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1033]) +22 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1124]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#1033]) +1 other test dmesg-fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2907])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#787]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +153 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#3432])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2887]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#314])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178]) +3 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#3304])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1188]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2320])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#309])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@forked-bo@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][58] ([Intel XE#1033]) +22 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@pipe-c.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][59] ([Intel XE#1033])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#701])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#702])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3321]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#310])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2423] / [i915#2575]) +62 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2380]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#1874]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#2351])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_frontbuffer_tracking@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2136]) +15 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2136] / [Intel XE#2351]) +22 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2136] / [Intel XE#2351]) +23 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#651])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2136]) +58 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#656]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#2423] / [i915#2575]) +154 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_lease@invalid-create-leases.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_lease@invalid-create-leases.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#356])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#616]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2493])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2763]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#870])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#3309])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#2446]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_pm_rpm@cursor.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2446]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2446]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2351])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2234] / [Intel XE#2850])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#3414] / [Intel XE#3904])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#2423]) +141 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_sequence@get-idle.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_sequence@get-idle.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [PASS][107] -> [DMESG-WARN][108] ([Intel XE#1033]) +1 other test dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_sysfs_edid_timing.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][109] ([Intel XE#1729])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][110] -> [DMESG-WARN][111] ([Intel XE#2953]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2423]) +9 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1447])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2905])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2905]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#1130]) +285 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1130]) +24 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1392])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#288]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-basic-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#288]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_exec_fault_mode@once-basic-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2360])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2229])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][125] -> [FAIL][126] ([Intel XE#1999]) +2 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][127] -> [FAIL][128] ([Intel XE#3546])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_module_load@many-reload.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2427])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@xe_peer2peer@read.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1061])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2284] / [Intel XE#366])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#944]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@bind-no-array-conflict:
    - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#1130]) +313 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_vm@bind-no-array-conflict.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_vm@bind-no-array-conflict.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1130]) +101 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][139] -> [ABORT][140] ([Intel XE#3084])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#3249]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2134]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@fbdev@read.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@fbdev@read.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2423] / [i915#2575]) -> [PASS][146] +117 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][147] -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][149] ([Intel XE#4164]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][151] ([Intel XE#3321]) -> [PASS][152] +2 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#1033]) -> [PASS][156] +17 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-7/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#2953]) -> [PASS][158] +5 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][159] ([Intel XE#886]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2136]) -> [PASS][162] +35 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][164] +10 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#1033]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][167] -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][169] ([Intel XE#1033] / [Intel XE#2566]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2446]) -> [PASS][172] +3 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][173] ([Intel XE#2883]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][175] ([Intel XE#2159]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [SKIP][201], [PASS][202]) ([Intel XE#378]) -> ([PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-2/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-7/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-8/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-5/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1130]) -> [PASS][229] +209 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][230] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][232] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [DMESG-WARN][234] -> [PASS][235] +7 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@fbdev@write:
    - shard-bmg:          [DMESG-WARN][236] ([Intel XE#1033]) -> [SKIP][237] ([Intel XE#2134])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@fbdev@write.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][238] ([Intel XE#2233]) -> [SKIP][239] ([Intel XE#2423])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#623]) -> [SKIP][241] ([Intel XE#2423] / [i915#2575])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2423] / [i915#2575]) -> [SKIP][243] ([Intel XE#3768])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          [SKIP][244] ([Intel XE#3768]) -> [SKIP][245] ([Intel XE#2423])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][246] ([Intel XE#2370]) -> [SKIP][247] ([Intel XE#2423])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][248] ([Intel XE#1033]) -> [SKIP][249] ([Intel XE#2136])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#316]) -> [SKIP][251] ([Intel XE#2136]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][252] ([Intel XE#2327]) -> [SKIP][253] ([Intel XE#2136]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#316]) -> [SKIP][255] ([Intel XE#2136] / [Intel XE#2351])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2136]) -> [SKIP][257] ([Intel XE#316]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][259] ([Intel XE#316]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][260] ([Intel XE#1033]) -> [SKIP][261] ([Intel XE#2136]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#607]) -> [SKIP][263] ([Intel XE#2136] / [Intel XE#2351])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][264] ([Intel XE#610]) -> [SKIP][265] ([Intel XE#2136]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2136]) -> [SKIP][267] ([Intel XE#610])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1124]) -> [SKIP][269] ([Intel XE#2136]) +9 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][271] ([Intel XE#1124]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#619]) -> [SKIP][273] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1124]) -> [SKIP][275] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2136]) -> [SKIP][277] ([Intel XE#1124]) +11 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][278] ([Intel XE#1124]) -> [SKIP][279] ([Intel XE#2136]) +15 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][280] ([Intel XE#3007]) -> [SKIP][281] ([Intel XE#2423]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2423] / [i915#2575]) -> [SKIP][283] ([Intel XE#2191]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2191]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][286] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][287] ([Intel XE#2423]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#367]) -> [SKIP][289] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2423] / [i915#2575]) -> [SKIP][291] ([Intel XE#367]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][292] ([Intel XE#367]) -> [SKIP][293] ([Intel XE#2423]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][295] ([Intel XE#1033])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][296] ([Intel XE#2887]) -> [SKIP][297] ([Intel XE#2136]) +26 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][299] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2907]) -> [SKIP][301] ([Intel XE#2136])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][306] ([Intel XE#3432]) -> [SKIP][307] ([Intel XE#2136]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][308] -> [DMESG-WARN][309] ([Intel XE#1033])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][310] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][311] ([Intel XE#2136])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#3442]) -> [SKIP][313] ([Intel XE#2136])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2136]) -> [SKIP][315] ([Intel XE#2907])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][316] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][317] ([Intel XE#2136]) +11 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][318] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [SKIP][319] ([Intel XE#2136] / [Intel XE#2351])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][321] ([Intel XE#2136]) +20 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#306]) -> [SKIP][323] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][324] ([Intel XE#2325]) -> [SKIP][325] ([Intel XE#2423]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2423] / [i915#2575]) -> [SKIP][327] ([Intel XE#306]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][328] ([Intel XE#2252]) -> [SKIP][329] ([Intel XE#2423]) +16 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#373]) -> [SKIP][331] ([Intel XE#2423] / [i915#2575]) +20 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2423] / [i915#2575]) -> [SKIP][333] ([Intel XE#373]) +13 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-signed:
    - shard-bmg:          [DMESG-WARN][334] ([Intel XE#877]) -> [SKIP][335] ([Intel XE#2423]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_color@ctm-signed.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][336] ([Intel XE#2390]) -> [SKIP][337] ([Intel XE#2423])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#307]) -> [SKIP][339] ([Intel XE#2423] / [i915#2575])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2423] / [i915#2575]) -> [SKIP][341] ([Intel XE#307])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][342] ([Intel XE#1178]) -> [SKIP][343] ([Intel XE#2423])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_content_protection@legacy.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2423] / [i915#2575]) -> [FAIL][345] ([Intel XE#1178])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_content_protection@legacy.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][346] ([Intel XE#1178]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_content_protection@srm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][348] ([Intel XE#2320]) -> [SKIP][349] ([Intel XE#2423]) +10 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2423] / [i915#2575]) -> [SKIP][351] ([Intel XE#308]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#308]) -> [SKIP][353] ([Intel XE#2423] / [i915#2575])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][354] ([Intel XE#2321]) -> [SKIP][355] ([Intel XE#2423]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#323]) -> [SKIP][357] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][358] ([Intel XE#2286]) -> [SKIP][359] ([Intel XE#2423])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-bmg:          [INCOMPLETE][360] ([Intel XE#3226]) -> [SKIP][361] ([Intel XE#2423])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][363] ([Intel XE#1033]) +7 other tests dmesg-warn
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][364] -> [SKIP][365] ([Intel XE#2136])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][366] ([Intel XE#1508]) -> [SKIP][367] ([Intel XE#2136])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][369] ([Intel XE#455]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#455]) -> [SKIP][371] ([Intel XE#2351])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_dsc@dsc-basic.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][372] ([Intel XE#2244]) -> [SKIP][373] ([Intel XE#2136]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][374] ([Intel XE#4156]) -> [SKIP][375] ([Intel XE#2136])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136]) -> [SKIP][377] ([Intel XE#776])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][378] ([Intel XE#2375]) -> [SKIP][379] ([Intel XE#2423])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2423] / [i915#2575]) -> [SKIP][381] ([Intel XE#1137])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#1135])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][384] ([Intel XE#301]) -> [SKIP][385] ([Intel XE#2423] / [i915#2575])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-WARN][386] ([Intel XE#1033]) -> [SKIP][387] ([Intel XE#2423]) +4 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [DMESG-FAIL][388] ([Intel XE#1033]) -> [DMESG-WARN][389] ([Intel XE#1033])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2-set2:     [INCOMPLETE][390] ([Intel XE#2049]) -> [SKIP][391] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_flip@flip-vs-panning.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][392] -> [DMESG-WARN][393] ([Intel XE#1033])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#455]) -> [SKIP][395] ([Intel XE#2136]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#455]) -> [SKIP][397] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][398] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][399] ([Intel XE#2136]) +7 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2136]) -> [SKIP][401] ([Intel XE#455]) +6 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136]) -> [SKIP][403] ([Intel XE#651]) +26 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][404] ([Intel XE#4141]) -> [SKIP][405] ([Intel XE#2136]) +28 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][406] ([Intel XE#2352]) -> [SKIP][407] ([Intel XE#2136])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][409] ([Intel XE#651]) +12 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#651]) -> [SKIP][411] ([Intel XE#2136]) +39 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][412] ([Intel XE#2311]) -> [SKIP][413] ([Intel XE#2136]) +52 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#651]) -> [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#658]) -> [SKIP][417] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][418] ([Intel XE#2313]) -> [SKIP][419] ([Intel XE#2136]) +52 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#1158]) -> [SKIP][421] ([Intel XE#2136])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#653]) -> [SKIP][423] ([Intel XE#2136]) +44 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#2136]) -> [SKIP][425] ([Intel XE#653]) +28 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][427] ([Intel XE#653]) +13 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#653]) -> [SKIP][429] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][430] ([Intel XE#2502]) -> [SKIP][431] ([Intel XE#2423])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2423] / [i915#2575]) -> [SKIP][433] ([Intel XE#605])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#455]) -> [SKIP][435] ([Intel XE#2423] / [i915#2575]) +15 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#346]) -> [SKIP][437] ([Intel XE#2136])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2925]) -> [SKIP][439] ([Intel XE#2136])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][440] ([Intel XE#2927]) -> [SKIP][441] ([Intel XE#2136]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][442] ([Intel XE#346]) -> [SKIP][443] ([Intel XE#2136])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2136]) -> [SKIP][445] ([Intel XE#346])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2136]) -> [SKIP][447] ([Intel XE#2927])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][448] ([Intel XE#4090]) -> [SKIP][449] ([Intel XE#2136])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][450] ([Intel XE#2501]) -> [SKIP][451] ([Intel XE#2423])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][452] ([Intel XE#2486]) -> [SKIP][453] ([Intel XE#2423])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2423] / [i915#2575]) -> [FAIL][455] ([Intel XE#616])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_plane_cursor@primary.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][456] ([Intel XE#2493]) -> [SKIP][457] ([Intel XE#2423])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2423] / [i915#2575]) -> [SKIP][461] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][462] ([Intel XE#2763]) -> [SKIP][463] ([Intel XE#2423]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][464] ([Intel XE#2938]) -> [SKIP][465] ([Intel XE#2136])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#870]) -> [SKIP][467] ([Intel XE#2136])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_pm_backlight@fade.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][468] ([Intel XE#870]) -> [SKIP][469] ([Intel XE#2136])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][471] ([Intel XE#1122])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][472] ([Intel XE#2392]) -> [SKIP][473] ([Intel XE#2136])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2136]) -> [SKIP][475] ([Intel XE#1129])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][476] ([Intel XE#3309]) -> [SKIP][477] ([Intel XE#2136])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2136]) -> [SKIP][479] ([Intel XE#908])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][480] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][481] ([Intel XE#2446]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][482] ([Intel XE#1033]) -> [SKIP][483] ([Intel XE#2446])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1489]) -> [SKIP][485] ([Intel XE#2136]) +12 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#2136]) -> [SKIP][487] ([Intel XE#1489]) +11 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][488] ([Intel XE#1489]) -> [SKIP][489] ([Intel XE#2136]) +14 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][490] ([Intel XE#2387]) -> [SKIP][491] ([Intel XE#2136]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#1122]) -> [SKIP][493] ([Intel XE#2136]) +2 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#2136]) -> [SKIP][495] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][497] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_psr@pr-sprite-render.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][499] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][500] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][501] ([Intel XE#2136]) +25 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2351]) -> [SKIP][503] ([Intel XE#2850] / [Intel XE#929])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][505] ([Intel XE#2136]) +16 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-dg2-set2:     [DMESG-WARN][506] ([Intel XE#1033]) -> [SKIP][507] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-180.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#3414]) -> [SKIP][509] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#2423] / [i915#2575]) -> [SKIP][511] ([Intel XE#1127])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][512] ([Intel XE#2330]) -> [SKIP][513] ([Intel XE#2423])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][514] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][515] ([Intel XE#2423]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#2423] / [i915#2575]) -> [SKIP][517] ([Intel XE#3414]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [INCOMPLETE][518] -> [DMESG-WARN][519] ([Intel XE#1033]) +1 other test dmesg-warn
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_setmode@basic.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][520] ([Intel XE#1729]) -> [SKIP][521] ([Intel XE#2426])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#330]) -> [SKIP][523] ([Intel XE#2423] / [i915#2575])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2423] / [i915#2575]) -> [SKIP][525] ([Intel XE#455]) +13 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2423] / [i915#2575]) -> [SKIP][527] ([Intel XE#2168])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_vrr@lobf.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][528] ([Intel XE#1499]) -> [SKIP][529] ([Intel XE#2423]) +4 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_vrr@max-min.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][530] ([Intel XE#756]) -> [SKIP][531] ([Intel XE#2423]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_writeback@writeback-check-output.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#756]) -> [SKIP][533] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][535] ([Intel XE#2423] / [i915#2575])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][537] ([Intel XE#1130])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1130]) -> [SKIP][539] ([Intel XE#1123]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1130]) -> [SKIP][541] ([Intel XE#1126])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#1126]) -> [SKIP][543] ([Intel XE#1130]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][544] ([Intel XE#2504]) -> [SKIP][545] ([Intel XE#1130])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-bmg:          [DMESG-WARN][546] ([Intel XE#1033]) -> [SKIP][547] ([Intel XE#1130])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#2905]) -> [SKIP][549] ([Intel XE#1130]) +18 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][550] ([Intel XE#2905]) -> [SKIP][551] ([Intel XE#1130]) +17 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#3889]) -> [SKIP][553] ([Intel XE#1130]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1130]) -> [SKIP][555] ([Intel XE#3889])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#1130]) -> [SKIP][557] ([Intel XE#2905]) +15 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][558] ([Intel XE#2322]) -> [SKIP][559] ([Intel XE#1130]) +16 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [SKIP][561] ([Intel XE#288]) +33 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-imm.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#288]) -> [SKIP][563] ([Intel XE#1130]) +51 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1130]) -> [SKIP][565] ([Intel XE#2360])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1130]) -> [DMESG-WARN][567] ([Intel XE#1033]) +4 other tests dmesg-warn
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#255]) -> [SKIP][569] ([Intel XE#1130])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#560]) -> [SKIP][571] ([Intel XE#1130])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][572] ([Intel XE#586]) -> [SKIP][573] ([Intel XE#1130])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@xe_mmap@small-bar.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1130]) -> [SKIP][575] ([Intel XE#512])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_mmap@small-bar.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#1130]) -> [SKIP][577] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][579] ([Intel XE#1130]) +14 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#1337]) -> [SKIP][581] ([Intel XE#1130])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#1130]) -> [SKIP][583] ([Intel XE#977])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][585] ([Intel XE#1130])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][586] ([Intel XE#2236]) -> [SKIP][587] ([Intel XE#1130])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#1130]) -> [SKIP][589] ([Intel XE#979])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][590] ([Intel XE#2284]) -> [SKIP][591] ([Intel XE#1130]) +1 other test skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][592] ([Intel XE#1033]) -> [SKIP][593] ([Intel XE#1130]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][595] ([Intel XE#1130]) +4 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [DMESG-WARN][596] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][597] ([Intel XE#1130])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_pm@s3-exec-after.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][598] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][599] ([Intel XE#1130])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][600] ([Intel XE#1033] / [Intel XE#2280]) -> [SKIP][601] ([Intel XE#1130])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-dg2-set2:     [INCOMPLETE][602] ([Intel XE#1033]) -> [DMESG-WARN][603] ([Intel XE#1033])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#944]) -> [SKIP][605] ([Intel XE#1130]) +3 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][606] ([Intel XE#944]) -> [SKIP][607] ([Intel XE#1130]) +4 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1130]) -> [SKIP][609] ([Intel XE#944]) +3 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#1130]) -> [SKIP][611] ([Intel XE#4130])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][612] ([Intel XE#4130]) -> [SKIP][613] ([Intel XE#1130]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#1130]) -> [SKIP][615] ([Intel XE#3342])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#3342]) -> [SKIP][617] ([Intel XE#1130])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8 -> xe-pw-142464v5

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8: 006a892140827b356eb4ad5a5e9b947477791ba8
  xe-pw-142464v5: 142464v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/index.html

--===============7399119453692533289==
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
<tr><td><b>Series:</b></td><td>Enable Survivability mode (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142464/">https://patchwork.freedesktop.org/series/142464/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142464v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142464v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2554-006a892140827b356eb4ad5a5e9b94747=
7791ba8_full -&gt; xe-pw-142464v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142464v5_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142464v5_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1424=
64v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-2/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/i=
gt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html">INCOMPLETE</a>=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_sequ=
ence@queue-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-4/igt@kms_sequence@queue-idle.html"=
>INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-a=
dlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html=
">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@intel-max-src-size:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sh=
ard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a></=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142464v5_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_g=
etstats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@core_get=
version@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@core_getversion@all-cards.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_g=
etversion@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_getversion@basic.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@core_s=
etmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_setmaste=
r@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@core_s=
etmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_set=
master@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@core_setmaster@master-drop-se=
t-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@core_setmaster_vs_auth.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@fbdev@=
info.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142464v5/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@fbdev@nu=
llptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@read.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE=
#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Inte=
l XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_atomic_transition@plane-a=
ll-transition-fencing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb=
@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +50 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bm=
g-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/i=
gt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">=
Intel XE#1033</a>) +22 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-a=
dlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_cursor_legacy@2x-long-no=
nblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cursor_legacy@forked-bo=
@pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>) +22 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-4/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_flip@busy-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tr=
acking@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sha=
rd-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +58 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_le=
ase@invalid-create-leases.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_lease@invalid=
-create-leases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +154 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_pm_r=
pm@cursor.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_rpm@cursor.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel X=
E#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_rpm@universal-planes=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_psr@fbc-psr2-primary-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr@psr-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_psr@psr2-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_sequ=
ence@get-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_sequence@get-idle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) +141 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_sy=
sfs_edid_timing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_sysfs_edid_timing.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-4/igt@=
kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-d=
estroy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_eudebug_online@pagefault=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_exec_bal=
ancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +285 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_exec_basic@many-execqueues=
-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_exec_basic@multigpu-no-ex=
ec-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_fault_mode@many-use=
rptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_exec_fault_mode@once-basi=
c-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/222=
9">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_=
migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_peer2peer@read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142464v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_vm@bi=
nd-no-array-conflict.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_vm@bind-no-array-conf=
lict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>) +313 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_vm@large-split-binds-536=
870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>) +101 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_wedge=
d@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_wedged@wedged-mode-to=
ggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt=
@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@fbdev@read.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +117 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_at=
omic_transition@plane-all-modeset-transition@pipe-b-dp-4.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v=
5/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe=
-b-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_fbco=
n_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4164">Intel XE#4164</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@kms_fbcon_fbt=
@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sha=
rd-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-8/igt@kms_flip=
@flip-vs-panning-vs-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-7/ig=
t@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@km=
s_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xti=
le-to-64bpp-xtile-upscaling.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142464v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_pipe=
_crc_basic@read-crc@pipe-d-dp-2.html">INCOMPLETE</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-2/igt@kms_pip=
e_crc_basic@read-crc@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-8/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2566">Intel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142464v5/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-=
unity-scaling-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm=
_rpm@legacy-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_rpm=
@legacy-planes.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b94747779=
1ba8/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b9474=
77791ba8/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b=
947477791ba8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a=
5e9b947477791ba8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4=
ad5a5e9b947477791ba8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b35=
6eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a89214082=
7b356eb4ad5a5e9b947477791ba8/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a8921=
40827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-006a=
892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2554-=
006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/sh=
ard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba=
8/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pm@=
s2idle-exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_pm@s2idl=
e-exec-after.html">PASS</a> +209 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@xe_pm@s3=
-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1=
/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-6/i=
gt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-adlp-8/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">DMESG-WARN</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-adlp-8/igt@xe_pm_reside=
ncy@gt-c6-freeze@gt0.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@fbdev@wr=
ite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@fbdev@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-=
3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">=
Intel XE#3768</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_asyn=
c_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/i=
gt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142464v5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_big_=
fb@4-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/i=
gt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@km=
s_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@=
kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard=
-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5=
/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2=
-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@km=
s_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other =
test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sh=
ard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142464v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/=
shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sh=
ard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142464v5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142464v5/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-46=
6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_bw@l=
inear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-b=
mg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/s=
hard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_cc=
s@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-4=
66/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/s=
hard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-g=
en12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bm=
g-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2=
-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard=
-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_ccs@=
missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4010">Intel XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/=
shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_ch=
amelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@k=
ms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +16=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_colo=
r@ctm-signed.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_color@ctm-=
signed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sh=
ard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_co=
ntent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2=
-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/=
shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/=
shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#228=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_curs=
or_legacy@cursor-vs-flip-legacy.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg=
-3/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_cu=
rsor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-m=
odeset-vs-cursor-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb=
-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2=
-436/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_ds=
c@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_dsc@dsc-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_fbcon=
_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-43=
4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@km=
s_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@km=
s_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sha=
rd-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">=
Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fl=
ip@flip-vs-panning.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_=
flip@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_flip=
@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_flip@fl=
ip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142464v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@k=
ms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142464v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_getf=
b@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_getfb@ge=
tfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-43=
4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_hd=
r@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_hdr@b=
rightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms=
_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/=
igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard=
-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bm=
g-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/=
igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_pm_backligh=
t@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_ba=
cklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg=
2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_pm_dc@deep-=
pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464=
v5/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-4=
66/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5=
/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v5/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ps=
r@fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_psr@fbc-pr-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ps=
r@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/=
igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3=
/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other t=
ests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms_p=
sr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ps=
r@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_ro=
tation_crc@primary-rotation-180.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2=
-466/igt@kms_rotation_crc@primary-rotation-180.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-d=
g2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v5/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-b=
mg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2464v5/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-2/igt@kms_setm=
ode@basic.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142464v5/shard-bmg-1/igt@kms_setmode@basic.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-8/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@kms=
_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@kms_writ=
eback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@kms_=
writeback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt=
@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel =
XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142464v5/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/s=
hard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_drm_f=
dinfo@utilization-others-full-load.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-=
bmg-3/igt@xe_drm_fdinfo@utilization-others-full-load.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-d=
g2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE=
#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_eud=
ebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target=
-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@=
xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +33 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-=
dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg=
2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2=
360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1424=
64v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-r=
ace.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_media_fil=
l@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-1/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_mmap@small-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_mmap@small-bar=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#357=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
464v5/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_pat@pat-ind=
ex-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-3/igt@xe_pm@d3=
cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_pm@d3cold-m=
map-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm@=
d3hot-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe=
_pm@d3hot-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-436/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_pm@s3=
-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@x=
e_pm@s3-exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
466/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-=
3/igt@xe_pm@s4-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-434/igt@xe_pm_=
residency@idle-residency-on-exec.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg=
2-434/igt@xe_pm_residency@idle-residency-on-exec.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-7/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-bmg-3/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-436/igt@x=
e_query@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-=
434/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-bmg-4/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42464v5/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-466/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-434/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8/shard-dg2-463/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142464v5/shard-dg2-466/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8 -&gt; xe-pw-142=
464v5</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8: 006a892140827b356eb4ad5=
a5e9b947477791ba8<br />
  xe-pw-142464v5: 142464v5</p>

</body>
</html>

--===============7399119453692533289==--
