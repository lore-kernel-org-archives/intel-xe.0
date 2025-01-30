Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD8C0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 02:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0C10E20F;
	Thu, 30 Jan 2025 02:01:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746A910E20F;
 Thu, 30 Jan 2025 02:01:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1894655351768754051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_PXP_HWDRM_support_=28r?=
 =?utf-8?q?ev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 02:01:03 -0000
Message-ID: <173820246344.2640361.2462532472798961636@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250129174140.948829-1-daniele.ceraolospurio@intel.com>
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

--===============1894655351768754051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PXP HWDRM support (rev7)
URL   : https://patchwork.freedesktop.org/series/136052/
State : failure

== Summary ==

CI Bug Log - changes from xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15_full -> xe-pw-136052v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136052v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136052v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136052v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +5 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_mmap_write_crc@main.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-2/igt@kms_mmap_write_crc@main.html

  * igt@xe_create@create-invalid-mbz:
    - shard-adlp:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_create@create-invalid-mbz.html
    - shard-bmg:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-4/igt@xe_create@create-invalid-mbz.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-4/igt@xe_create@create-invalid-mbz.html

  * igt@xe_exec_queue_property@invalid-property:
    - shard-lnl:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-5/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html
    - shard-dg2-set2:     [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_vm@bind-flag-invalid.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_vm@bind-flag-invalid.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#2136]) -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [SKIP][19] ([Intel XE#2446]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
Known issues
------------

  Here are the changes found in xe-pw-136052v7_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#3249])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2134])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@fbdev@eof.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@fbdev@eof.html

  * igt@fbdev@read:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2134])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#2134]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@fbdev@unaligned-write.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2423] / [i915#2575]) +105 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-bmg:          [PASS][31] -> [INCOMPLETE][32] ([Intel XE#3225])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2136]) +39 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2136]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2327]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][40] ([Intel XE#1033])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#607])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1124]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1124]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#367])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#787]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2887]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#787]) +160 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#3113] / [Intel XE#4010])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2252]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#373]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1178]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1178])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#308]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#4172]) +7 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#309])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2286])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1340])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455]) +9 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#776])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][71] ([Intel XE#4172])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#2882]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][73] ([Intel XE#4172]) +10 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#3321]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2316])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2423]) +66 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#310])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3321]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#886]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2380])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293] / [Intel XE#2380])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#651])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2136]) +17 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4141]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2311]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1151])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#653])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#656]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     [PASS][99] -> [DMESG-WARN][100] ([Intel XE#1033])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#455])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][102] ([Intel XE#616]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2493])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2423]) +10 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2763]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#836])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#2446])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#2446]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1489])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1489])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1489]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2387])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1435])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][124] -> [DMESG-WARN][125] ([Intel XE#2953]) +3 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#1033]) +10 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#2159]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#756])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_writeback@writeback-check-output.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1126])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2905])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2905]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2905])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1130]) +19 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#1130]) +152 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1392]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1392]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2322]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-adlp:         [PASS][143] -> [DMESG-WARN][144] ([Intel XE#4173])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2229])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#1192])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][148] -> [FAIL][149] ([Intel XE#1999]) +2 other tests fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#378])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][152] -> [ABORT][153] ([Intel XE#1358] / [Intel XE#1794]) +2 other tests abort
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_pm@s2idle-basic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2284])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][155] ([Intel XE#1033] / [Intel XE#569])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][156] -> [ABORT][157] ([Intel XE#1358] / [Intel XE#1607])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][158] -> [ABORT][159] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#944])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#944])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#3342])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [PASS][164] -> [SKIP][165] ([Intel XE#1130]) +188 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_vm@invalid-extensions.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_vm@invalid-extensions.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#2423]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getstats.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][168] ([Intel XE#3440]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getversion@all-cards.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][170] ([Intel XE#3249]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2134]) -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@fbdev@info.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][174] ([Intel XE#2136]) -> [PASS][175] +19 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][177] +12 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_color@ctm-negative:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#877]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_color@ctm-negative.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-7/igt@kms_color@ctm-negative.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-adlp:         [DMESG-WARN][184] -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][186] ([Intel XE#2291]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#2423] / [i915#2575]) -> [PASS][189] +120 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip@busy-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2136]) -> [PASS][191] +26 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][192] ([Intel XE#1503]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [SKIP][194] ([Intel XE#2423]) -> [PASS][195] +81 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
    - shard-bmg:          [DMESG-WARN][196] ([Intel XE#4172]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [SKIP][198] ([Intel XE#2446]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2446]) -> [PASS][201] +3 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][202] ([Intel XE#2883]) -> [PASS][203] +2 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_setmode@basic.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][204] ([Intel XE#899]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [DMESG-WARN][206] ([Intel XE#4173]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2229]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][212] ([Intel XE#3546]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_module_load@reload.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [ABORT][214] -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][216] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][218] ([Intel XE#2953]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][220] ([Intel XE#1130]) -> [PASS][221] +170 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1130]) -> [PASS][223] +220 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2136]) -> [DMESG-WARN][225] ([Intel XE#1033]) +2 other tests dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#3768]) -> [SKIP][227] ([Intel XE#2423] / [i915#2575])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][228] ([Intel XE#2385]) -> [SKIP][229] ([Intel XE#2423])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][230] ([Intel XE#2423]) -> [SKIP][231] ([Intel XE#2370])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#316]) -> [SKIP][233] ([Intel XE#2136] / [Intel XE#2351])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2136]) -> [SKIP][235] ([Intel XE#316]) +4 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][236] ([Intel XE#2136]) -> [SKIP][237] ([Intel XE#2327]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#316]) -> [SKIP][239] ([Intel XE#2136])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][240] ([Intel XE#2327]) -> [SKIP][241] ([Intel XE#2136]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][243] ([Intel XE#316]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1124]) -> [SKIP][245] ([Intel XE#2136]) +10 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][247] ([Intel XE#607])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][249] ([Intel XE#1124]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][250] ([Intel XE#1124]) -> [SKIP][251] ([Intel XE#2136]) +8 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][252] ([Intel XE#2136]) -> [SKIP][253] ([Intel XE#1124]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2136]) -> [SKIP][255] ([Intel XE#1124]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1124]) -> [SKIP][257] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][259] ([Intel XE#619]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][260] ([Intel XE#2136]) -> [SKIP][261] ([Intel XE#607])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][262] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][263] ([Intel XE#2423]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][264] ([Intel XE#2423]) -> [SKIP][265] ([Intel XE#2314] / [Intel XE#2894])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2191]) -> [SKIP][267] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][268] ([Intel XE#2423]) -> [SKIP][269] ([Intel XE#367]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#367]) -> [SKIP][271] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2423] / [i915#2575]) -> [SKIP][273] ([Intel XE#367]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][274] ([Intel XE#367]) -> [SKIP][275] ([Intel XE#2423]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2907]) -> [SKIP][277] ([Intel XE#2136]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][278] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][279] ([Intel XE#2136]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][280] ([Intel XE#2887]) -> [SKIP][281] ([Intel XE#2136]) +10 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][283] ([Intel XE#1033])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][285] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][287] ([Intel XE#2136]) +7 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][288] ([Intel XE#2136]) -> [SKIP][289] ([Intel XE#3432]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][290] ([Intel XE#3432]) -> [SKIP][291] ([Intel XE#2136]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#2887]) +14 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][295] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2136]) -> [INCOMPLETE][297] ([Intel XE#2692] / [Intel XE#4010])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2136]) -> [SKIP][299] ([Intel XE#2907]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2136]) -> [SKIP][301] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#314]) -> [SKIP][303] ([Intel XE#2136] / [Intel XE#2351])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#2252]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edid.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][306] ([Intel XE#2252]) -> [SKIP][307] ([Intel XE#2423]) +9 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2423] / [i915#2575]) -> [SKIP][309] ([Intel XE#306]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#306]) -> [SKIP][311] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          [SKIP][312] ([Intel XE#2423]) -> [SKIP][313] ([Intel XE#2325]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_color@gamma.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#373]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2423] / [i915#2575]) -> [SKIP][317] ([Intel XE#373]) +15 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-bmg:          [SKIP][318] ([Intel XE#2423]) -> [DMESG-WARN][319] ([Intel XE#4172]) +1 other test dmesg-warn
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_color@invalid-gamma-lut-sizes.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][320] ([Intel XE#1178]) -> [SKIP][321] ([Intel XE#2423])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_content_protection@atomic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][322] ([Intel XE#1178]) -> [SKIP][323] ([Intel XE#2341])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][324] ([Intel XE#2423]) -> [SKIP][325] ([Intel XE#2341]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@content-type-change.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][326] ([Intel XE#2423]) -> [SKIP][327] ([Intel XE#2390])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2423] / [i915#2575]) -> [SKIP][329] ([Intel XE#307])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][330] ([Intel XE#2423]) -> [FAIL][331] ([Intel XE#1178])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@legacy.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][332] ([Intel XE#1178]) -> [SKIP][333] ([Intel XE#2423] / [i915#2575])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_content_protection@legacy.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][334] ([Intel XE#2341]) -> [SKIP][335] ([Intel XE#2423])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_content_protection@lic-type-1.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2423] / [i915#2575]) -> [FAIL][337] ([Intel XE#1178])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@srm.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2423] / [i915#2575]) -> [SKIP][339] ([Intel XE#308]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][340] ([Intel XE#2423]) -> [SKIP][341] ([Intel XE#2320]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#308]) -> [SKIP][343] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][344] ([Intel XE#2423]) -> [SKIP][345] ([Intel XE#2321]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#455]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][348] ([Intel XE#2320]) -> [SKIP][349] ([Intel XE#2423]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][350] ([Intel XE#2321]) -> [SKIP][351] ([Intel XE#2423]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][353] ([Intel XE#1033]) +7 other tests dmesg-warn
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#323]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [INCOMPLETE][356] ([Intel XE#3226]) -> [SKIP][357] ([Intel XE#2423])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][358] ([Intel XE#2291]) -> [SKIP][359] ([Intel XE#2423])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][360] ([Intel XE#2423]) -> [SKIP][361] ([Intel XE#2286])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][362] ([Intel XE#2286]) -> [SKIP][363] ([Intel XE#2423])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#307]) -> [SKIP][365] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][366] ([Intel XE#2244]) -> [SKIP][367] ([Intel XE#2136])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_dsc@dsc-basic.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#455]) -> [SKIP][369] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
    - shard-bmg:          [SKIP][370] ([Intel XE#2136]) -> [SKIP][371] ([Intel XE#2244])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_dsc@dsc-with-formats.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][372] ([Intel XE#2136]) -> [SKIP][373] ([Intel XE#776])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fbcon_fbt@psr.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2136]) -> [SKIP][375] ([Intel XE#776])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#703]) -> [SKIP][377] ([Intel XE#2423] / [i915#2575])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2423] / [i915#2575]) -> [SKIP][379] ([Intel XE#1138])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2423] / [i915#2575]) -> [SKIP][381] ([Intel XE#1137])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#1135])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][384] ([Intel XE#2423]) -> [SKIP][385] ([Intel XE#2374])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][386] ([Intel XE#2316]) -> [FAIL][387] ([Intel XE#3321])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][388] ([Intel XE#2316]) -> [SKIP][389] ([Intel XE#2423]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][390] ([Intel XE#301]) -> [SKIP][391] ([Intel XE#2423] / [i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][392] ([Intel XE#2423]) -> [FAIL][393] ([Intel XE#2882])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][396] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][397] ([Intel XE#2136]) +3 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#455]) -> [SKIP][399] ([Intel XE#2136]) +4 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][400] ([Intel XE#2136]) -> [SKIP][401] ([Intel XE#2380])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][403] ([Intel XE#455]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#455]) +6 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][406] ([Intel XE#2136]) -> [SKIP][407] ([Intel XE#2311]) +27 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][408] ([Intel XE#2311]) -> [SKIP][409] ([Intel XE#2312]) +11 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][410] ([Intel XE#2312]) -> [SKIP][411] ([Intel XE#2311]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][413] ([Intel XE#651]) +14 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2136]) -> [SKIP][415] ([Intel XE#651]) +23 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][416] ([Intel XE#2311]) -> [SKIP][417] ([Intel XE#2136]) +26 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][418] ([Intel XE#4141]) -> [SKIP][419] ([Intel XE#2136]) +8 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][420] ([Intel XE#4141]) -> [SKIP][421] ([Intel XE#2312]) +4 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][422] ([Intel XE#2312]) -> [SKIP][423] ([Intel XE#4141]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][424] ([Intel XE#2136]) -> [SKIP][425] ([Intel XE#4141]) +15 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#651]) -> [SKIP][427] ([Intel XE#2136]) +23 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][428] ([Intel XE#2312]) -> [SKIP][429] ([Intel XE#2136]) +6 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#651]) -> [SKIP][431] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#658]) -> [SKIP][433] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][434] ([Intel XE#2312]) -> [SKIP][435] ([Intel XE#2313]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][436] ([Intel XE#2313]) -> [SKIP][437] ([Intel XE#2136]) +24 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][438] ([Intel XE#2313]) -> [SKIP][439] ([Intel XE#2312]) +11 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][440] ([Intel XE#2136]) -> [SKIP][441] ([Intel XE#2350])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#653]) -> [SKIP][443] ([Intel XE#2136]) +24 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2136]) -> [SKIP][445] ([Intel XE#653]) +28 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#653]) -> [SKIP][447] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][449] ([Intel XE#653]) +12 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][450] ([Intel XE#2136]) -> [SKIP][451] ([Intel XE#2313]) +25 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2423] / [i915#2575]) -> [SKIP][453] ([Intel XE#605])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#346])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2925]) -> [SKIP][457] ([Intel XE#2136])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][458] ([Intel XE#2927]) -> [SKIP][459] ([Intel XE#2136]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2136]) -> [SKIP][461] ([Intel XE#346])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][462] ([Intel XE#2136]) -> [SKIP][463] ([Intel XE#2934])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][464] ([Intel XE#2423]) -> [SKIP][465] ([Intel XE#2501])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#356]) -> [SKIP][467] ([Intel XE#2423] / [i915#2575])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][468] ([Intel XE#2423]) -> [SKIP][469] ([Intel XE#2486]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][470] ([Intel XE#2423]) -> [SKIP][471] ([Intel XE#2393])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][472] ([Intel XE#2493]) -> [SKIP][473] ([Intel XE#2423])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][475] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#2423] / [i915#2575]) -> [SKIP][477] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][478] ([Intel XE#2763]) -> [SKIP][479] ([Intel XE#2423])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][480] ([Intel XE#870]) -> [SKIP][481] ([Intel XE#2136])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2136]) -> [SKIP][483] ([Intel XE#870]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][484] ([Intel XE#2136]) -> [SKIP][485] ([Intel XE#2391])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#1122]) -> [SKIP][487] ([Intel XE#2136] / [Intel XE#2351])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#908]) -> [SKIP][489] ([Intel XE#2136] / [Intel XE#2351])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][491] ([Intel XE#1129])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#908])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][494] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][495] ([Intel XE#2446])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][496] ([Intel XE#2446]) -> [SKIP][497] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#2446]) -> [DMESG-WARN][499] ([Intel XE#1033] / [Intel XE#2042])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][500] ([Intel XE#2136]) -> [SKIP][501] ([Intel XE#1489]) +6 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2136]) -> [SKIP][503] ([Intel XE#1489]) +14 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][504] ([Intel XE#1489]) -> [SKIP][505] ([Intel XE#2136]) +5 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1489]) -> [SKIP][507] ([Intel XE#2136]) +10 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1122]) -> [SKIP][509] ([Intel XE#2136])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][510] ([Intel XE#2136]) -> [SKIP][511] ([Intel XE#2387]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#2136]) -> [SKIP][513] ([Intel XE#1122]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][514] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][515] ([Intel XE#2136]) +15 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][517] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          [SKIP][518] ([Intel XE#2136]) -> [SKIP][519] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][521] ([Intel XE#2136]) +7 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#2136]) -> [SKIP][523] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][525] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2423] / [i915#2575]) -> [SKIP][527] ([Intel XE#3414]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][528] ([Intel XE#2423]) -> [SKIP][529] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#2423] / [i915#2575]) -> [SKIP][531] ([Intel XE#1127])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][532] ([Intel XE#2330]) -> [SKIP][533] ([Intel XE#2423])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#3414]) -> [SKIP][535] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#1127]) -> [SKIP][537] ([Intel XE#2423] / [i915#2575])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][538] ([Intel XE#2423]) -> [SKIP][539] ([Intel XE#2413]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][540] ([Intel XE#2423]) -> [SKIP][541] ([Intel XE#1435])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#2423] / [i915#2575]) -> [FAIL][543] ([Intel XE#1729])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#2423] / [i915#2575]) -> [SKIP][545] ([Intel XE#1500])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][546] ([Intel XE#2423]) -> [SKIP][547] ([Intel XE#2450])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [DMESG-WARN][548] ([Intel XE#4172]) -> [SKIP][549] ([Intel XE#2423]) +5 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][550] ([Intel XE#2423]) -> [SKIP][551] ([Intel XE#2168])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_vrr@cmrr.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][552] ([Intel XE#1499]) -> [SKIP][553] ([Intel XE#2423])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_vrr@flip-dpms.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2423] / [i915#2575]) -> [SKIP][555] ([Intel XE#455]) +9 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vrr@flipline.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][556] ([Intel XE#2168]) -> [SKIP][557] ([Intel XE#2423])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_vrr@lobf.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#2423] / [i915#2575]) -> [SKIP][559] ([Intel XE#756]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][560] ([Intel XE#2423]) -> [SKIP][561] ([Intel XE#756])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#756]) -> [SKIP][563] ([Intel XE#2423] / [i915#2575])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][564] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][565] ([Intel XE#2423])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][567] ([Intel XE#2423] / [i915#2575])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#2423]) -> [DMESG-WARN][569] ([Intel XE#2705])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@testdisplay.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][571] ([Intel XE#1130]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#1130]) -> [SKIP][573] ([Intel XE#1123])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1130]) -> [SKIP][575] ([Intel XE#1126]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][576] ([Intel XE#3889]) -> [SKIP][577] ([Intel XE#1130])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][578] ([Intel XE#2905]) -> [SKIP][579] ([Intel XE#1130]) +7 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][580] ([Intel XE#1130]) -> [SKIP][581] ([Intel XE#3889]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#3889]) -> [SKIP][583] ([Intel XE#1130])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#2905]) -> [SKIP][585] ([Intel XE#1130]) +10 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][586] ([Intel XE#1130]) -> [SKIP][587] ([Intel XE#2905]) +7 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][588] ([Intel XE#1130]) -> [SKIP][589] ([Intel XE#2322]) +9 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][590] ([Intel XE#2322]) -> [SKIP][591] ([Intel XE#1130]) +6 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][592] ([Intel XE#4172]) -> [SKIP][593] ([Intel XE#1130]) +4 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#288]) -> [SKIP][595] ([Intel XE#1130]) +30 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#1130]) -> [SKIP][597] ([Intel XE#288]) +34 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#2360]) -> [SKIP][599] ([Intel XE#1130])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#1130]) -> [SKIP][601] ([Intel XE#2905]) +17 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][602] ([Intel XE#1130]) -> [SKIP][603] ([Intel XE#2459] / [Intel XE#2596])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_media_fill@media-fill.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][604] ([Intel XE#1130]) -> [SKIP][605] ([Intel XE#586])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_mmap@small-bar.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][607] ([Intel XE#1130]) +9 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][608] ([Intel XE#2248]) -> [SKIP][609] ([Intel XE#1130])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#1130]) -> [SKIP][611] ([Intel XE#2541] / [Intel XE#3573]) +11 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][612] ([Intel XE#1130]) -> [SKIP][613] ([Intel XE#2248])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_oa@unprivileged-single-ctx-counters.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#1130]) -> [SKIP][615] ([Intel XE#977])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][616] ([Intel XE#1130]) -> [SKIP][617] ([Intel XE#2245])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#1130]) -> [SKIP][619] ([Intel XE#979])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][620] ([Intel XE#1130]) -> [SKIP][621] ([Intel XE#2284])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][623] ([Intel XE#1130]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#1130]) -> [SKIP][625] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [SKIP][626] ([Intel XE#1130]) -> [DMESG-WARN][627] ([Intel XE#4172] / [Intel XE#569])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@s3-basic-exec.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][628] ([Intel XE#4172] / [Intel XE#569]) -> [SKIP][629] ([Intel XE#1130])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#1130]) -> [SKIP][631] ([Intel XE#579])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][632] ([Intel XE#944]) -> [SKIP][633] ([Intel XE#1130]) +2 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#944]) -> [SKIP][635] ([Intel XE#1130]) +2 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][636] ([Intel XE#1130]) -> [SKIP][637] ([Intel XE#944]) +2 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#1130]) -> [SKIP][639] ([Intel XE#944]) +4 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#4130]) -> [SKIP][641] ([Intel XE#1130])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][642] ([Intel XE#1130]) -> [SKIP][643] ([Intel XE#4130])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#1130]) -> [SKIP][645] ([Intel XE#4130])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#1130]) -> [SKIP][647] ([Intel XE#3342])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#3342]) -> [SKIP][649] ([Intel XE#1130])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1130]) -> [DMESG-WARN][651] ([Intel XE#1033]) +1 other test dmesg-warn
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_vm@large-userptr-misaligned-binds-33554432.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
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
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
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
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15 -> xe-pw-136052v7

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbdedb050ef891b9feef15
  xe-pw-136052v7: 136052v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/index.html

--===============1894655351768754051==
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
<tr><td><b>Series:</b></td><td>Add PXP HWDRM support (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136052/">https://patchwork.freedesktop.org/series/136052/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15_full -&gt; xe-pw-136052v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136052v7_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136052v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136052v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_mmap_write_crc@main.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-2/igt@kms_mmap_write_crc@main.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-invalid-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_create@create-invalid-mbz.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-4/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-4/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-5/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_vm@bind-flag-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_vm@bind-flag-invalid.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136052v7_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_getfb@getfb2-accept-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_vblank@wait-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_eudebug@basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_vm@invalid-extensions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_vm@invalid-extensions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +188 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@core_getstats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@fbdev@info.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_color@ctm-negative.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-7/igt@kms_color@ctm-negative.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@kms_color@invalid-gamma-lut-sizes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_flip@busy-flip.html">PASS</a> +120 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_module_load@reload-no-display.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +170 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +220 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_color@invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_color@invalid-gamma-lut-sizes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v7/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15 -&gt; xe-pw-136052v7</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbdedb050ef891b9feef15<br />
  xe-pw-136052v7: 136052v7</p>

</body>
</html>

--===============1894655351768754051==--
