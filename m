Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE6C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 17:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06F410E1CB;
	Mon, 12 May 2025 17:25:02 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCB310E053;
 Mon, 12 May 2025 17:25:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0237398787978816871=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Enable_SVM_atomics_in_Xe_/?=
 =?utf-8?q?_GPU_SVM_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 17:25:02 -0000
Message-ID: <174707070209.69697.704485100008966526@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512135500.1405019-1-matthew.brost@intel.com>
In-Reply-To: <20250512135500.1405019-1-matthew.brost@intel.com>
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

--===============0237398787978816871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable SVM atomics in Xe / GPU SVM (rev8)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

== Summary ==

CI Bug Log - changes from xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364_FULL -> xe-pw-147846v8_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-147846v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#2134])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@fbdev@unaligned-write.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][2] -> [SKIP][3] ([Intel XE#2134]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@fbdev@write.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@fbdev@write.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#4208] / [Intel XE#4618])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#827]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#4208] / [i915#2575]) +109 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][10] -> [FAIL][11] ([Intel XE#3908]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][13] ([Intel XE#4543])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#367]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +202 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4417]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4416]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#373]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#1178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1188])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1424])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#308])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4173]) +3 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#309]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#4354])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#310])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#301]) +5 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#3321]) +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#2882])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#2882]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][60] ([Intel XE#1504]) +1 other test timeout
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [INCOMPLETE][65] ([Intel XE#2049] / [Intel XE#2597])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][66] ([Intel XE#2049] / [Intel XE#2597])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#4208]) +243 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#651]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#651]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2351] / [Intel XE#4208]) +24 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#4596])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#4596])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][81] ([Intel XE#4212])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][82] ([Intel XE#4760])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2763]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#734])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1489])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2893])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1489]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4609])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#3414]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1127])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4208] / [i915#2575]) +71 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#455]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#1435]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#4459]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1280] / [Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#4497])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4837])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4837])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#4837]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#261] / [Intel XE#688])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_evict@evict-small.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4208]) +249 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#1392]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1392]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#288]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_system_allocator@many-stride-free:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#4915]) +39 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_system_allocator@many-stride-free.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#4943]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#4929] / [Intel XE#5018])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4915]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_system_allocator@twice-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#5012])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#378])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][122] -> [FAIL][123] ([Intel XE#4208]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_module_load@reload.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_module_load@reload.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1061] / [Intel XE#4208])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1948])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2284] / [Intel XE#366])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][128] -> [ABORT][129] ([Intel XE#1794]) +1 other test abort
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][130] -> [ABORT][131] ([Intel XE#1794])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#4733])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#944])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#2134]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@fbdev@unaligned-read.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@fbdev@unaligned-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][136] ([Intel XE#3908]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][138] ([Intel XE#4543]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][140] ([Intel XE#2291]) -> [PASS][141] +4 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][142] ([Intel XE#4302]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][144] ([Intel XE#1340]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][146] ([Intel XE#2316]) -> [PASS][147] +5 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][148] ([Intel XE#3321]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][150] ([Intel XE#886]) -> [PASS][151] +2 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#4208] / [i915#2575]) -> [PASS][153] +108 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_flip@busy-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#301]) -> [PASS][155] +4 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][156] ([Intel XE#301]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp4:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-dp4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][161] +11 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [INCOMPLETE][162] ([Intel XE#2050]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][164] ([Intel XE#1503]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][166] ([Intel XE#2571]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][168] ([Intel XE#718]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#4208]) -> [PASS][171] +218 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1392]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][174], [PASS][175], [PASS][176], [PASS][177], [SKIP][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199]) ([Intel XE#2457]) -> ([PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-1/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-2/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#4208]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_module_load@reload-no-display.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][227] ([Intel XE#1794]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#316]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#316]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][234] ([Intel XE#316]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#316]) -> [SKIP][236] ([Intel XE#4208]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][238] ([Intel XE#1124]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#607]) -> [SKIP][240] ([Intel XE#2351] / [Intel XE#4208])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4208]) -> [SKIP][242] ([Intel XE#1124]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1124]) -> [SKIP][244] ([Intel XE#4208]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][246] ([Intel XE#619])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#610])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1124]) -> [SKIP][250] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2191]) -> [SKIP][252] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#4208] / [i915#2575]) -> [SKIP][254] ([Intel XE#367]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#367]) -> [SKIP][256] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][258] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#4208]) -> [SKIP][260] ([Intel XE#2907]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][262] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][264] ([Intel XE#4208]) +15 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][265] ([Intel XE#3862]) -> [SKIP][266] ([Intel XE#4208])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#3442]) -> [SKIP][268] ([Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2351] / [Intel XE#4208]) -> [INCOMPLETE][270] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#4418]) -> [SKIP][274] ([Intel XE#2351] / [Intel XE#4208])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#306]) -> [SKIP][276] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_chamelium_color@gamma.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#373]) -> [SKIP][278] ([Intel XE#4208] / [i915#2575]) +10 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#4208] / [i915#2575]) -> [SKIP][280] ([Intel XE#373]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208] / [i915#2575]) -> [FAIL][282] ([Intel XE#1178])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_content_protection@atomic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][283] ([Intel XE#1178]) -> [SKIP][284] ([Intel XE#2341])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#307]) -> [SKIP][286] ([Intel XE#4208] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][287] ([Intel XE#2341]) -> [FAIL][288] ([Intel XE#1178])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#1188]) -> [SKIP][290] ([Intel XE#4208] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_content_protection@uevent.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][291] ([Intel XE#2341]) -> [FAIL][292] ([Intel XE#1188])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_content_protection@uevent.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208] / [i915#2575]) -> [SKIP][294] ([Intel XE#308]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208] / [i915#2575]) -> [SKIP][296] ([Intel XE#323]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#323]) -> [SKIP][298] ([Intel XE#4208] / [i915#2575])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4354]) -> [SKIP][300] ([Intel XE#4208])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#455]) -> [SKIP][302] ([Intel XE#2351] / [Intel XE#4208])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4208] / [i915#2575]) -> [SKIP][304] ([Intel XE#1137])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208] / [i915#2575]) -> [SKIP][306] ([Intel XE#1135])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][307] ([Intel XE#2882]) -> [SKIP][308] ([Intel XE#2316])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208] / [i915#2575]) -> [FAIL][310] ([Intel XE#301])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#455]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#455]) -> [SKIP][314] ([Intel XE#4208]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][316] ([Intel XE#455]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][317] ([Intel XE#2312]) -> [SKIP][318] ([Intel XE#2311]) +16 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][320] ([Intel XE#651]) +15 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][321] ([Intel XE#4141]) -> [SKIP][322] ([Intel XE#2312]) +14 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#4141]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#651]) -> [SKIP][326] ([Intel XE#4208]) +26 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#651]) +20 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][329] ([Intel XE#2311]) -> [SKIP][330] ([Intel XE#2312]) +19 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#651]) -> [SKIP][332] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][333] ([Intel XE#2313]) -> [SKIP][334] ([Intel XE#2312]) +18 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][335] ([Intel XE#2312]) -> [SKIP][336] ([Intel XE#2313]) +17 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#653]) -> [SKIP][338] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#658]) -> [SKIP][340] ([Intel XE#2351] / [Intel XE#4208])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#653]) -> [SKIP][342] ([Intel XE#4208]) +27 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][344] ([Intel XE#653]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208]) -> [SKIP][346] ([Intel XE#653]) +31 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208] / [i915#2575]) -> [SKIP][348] ([Intel XE#605])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2927]) -> [SKIP][350] ([Intel XE#4208])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#4208]) -> [SKIP][352] ([Intel XE#2927])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208]) -> [SKIP][354] ([Intel XE#2925]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][355] ([Intel XE#616]) -> [SKIP][356] ([Intel XE#4208] / [i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][357] ([Intel XE#4596]) -> [SKIP][358] ([Intel XE#5021]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4208] / [i915#2575]) -> [SKIP][360] ([Intel XE#5020]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208] / [i915#2575]) -> [ABORT][362] ([Intel XE#4760])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208] / [i915#2575]) -> [SKIP][364] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][366] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#870]) -> [SKIP][368] ([Intel XE#4208])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#1129])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#908]) -> [SKIP][372] ([Intel XE#2351] / [Intel XE#4208])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1129]) -> [SKIP][374] ([Intel XE#2351] / [Intel XE#4208])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#5017]) -> [SKIP][376] ([Intel XE#4208] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_properties@get_properties-sanity-non-atomic.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1489]) -> [SKIP][378] ([Intel XE#4208]) +9 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#4208]) -> [SKIP][380] ([Intel XE#1489]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1122]) -> [SKIP][382] ([Intel XE#4208])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208]) -> [SKIP][384] ([Intel XE#1122]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][386] ([Intel XE#4208]) +15 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4208]) -> [SKIP][388] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][390] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-render.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][392] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][394] ([Intel XE#2939])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208] / [i915#2575]) -> [SKIP][396] ([Intel XE#3414]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#3414]) -> [SKIP][398] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#4208] / [i915#2575]) -> [SKIP][400] ([Intel XE#1127])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#455]) -> [SKIP][402] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-center.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#4208] / [i915#2575]) -> [SKIP][404] ([Intel XE#455]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#4208] / [i915#2575]) -> [SKIP][406] ([Intel XE#756]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#4208]) -> [SKIP][408] ([Intel XE#1280] / [Intel XE#455])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][410] ([Intel XE#4208])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#4208]) -> [SKIP][412] ([Intel XE#1123]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1126]) -> [SKIP][414] ([Intel XE#4208])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#1126]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#4497]) -> [SKIP][418] ([Intel XE#4208])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_eu_stall@blocking-read.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> [SKIP][420] ([Intel XE#4497])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#4837]) -> [SKIP][422] ([Intel XE#4208]) +18 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#4208]) -> [SKIP][424] ([Intel XE#4837]) +12 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#4208]) -> [SKIP][426] ([Intel XE#4518])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1392]) -> [SKIP][428] ([Intel XE#4208]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208]) -> [SKIP][430] ([Intel XE#1392]) +4 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208]) -> [SKIP][432] ([Intel XE#288]) +31 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#288]) -> [SKIP][434] ([Intel XE#4208]) +29 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#4915]) -> [SKIP][436] ([Intel XE#4208]) +226 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#4208]) -> [SKIP][438] ([Intel XE#4915]) +204 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#4208]) -> [SKIP][440] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][442] ([Intel XE#4208]) +7 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#4208]) -> [SKIP][444] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208]) -> [SKIP][446] ([Intel XE#2838] / [Intel XE#979])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#4208]) -> [SKIP][448] ([Intel XE#979])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([Intel XE#2284] / [Intel XE#366])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][452] ([Intel XE#4208]) +2 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#4208]) -> [SKIP][454] ([Intel XE#579])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#4650]) -> [SKIP][456] ([Intel XE#4208]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#4208]) -> [SKIP][458] ([Intel XE#4733]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#4733]) -> [SKIP][460] ([Intel XE#4208]) +4 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#944]) -> [SKIP][462] ([Intel XE#4208]) +4 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#4208]) -> [SKIP][464] ([Intel XE#944]) +5 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#4208]) -> [SKIP][466] ([Intel XE#4814])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208]) -> [SKIP][468] ([Intel XE#4130])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#4130]) -> [SKIP][470] ([Intel XE#4208])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#4208]) -> [SKIP][472] ([Intel XE#3342])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#4351]) -> [SKIP][474] ([Intel XE#4208])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_sriov_scheduling@equal-throughput.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364 -> xe-pw-147846v8

  IGT_8361: 8361
  xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364: 986f0a9c6ade97d95f739c079550e53932ed4364
  xe-pw-147846v8: 147846v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/index.html

--===============0237398787978816871==
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
<tr><td><b>Series:</b></td><td>Enable SVM atomics in Xe / GPU SVM (rev8)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147846/">https://patchwork.freedesktop.org/series/147846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147846v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3068-986f0a9c6ade97d95f739c079550e5393=
2ed4364_FULL -&gt; xe-pw-147846v8_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147846v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@fbdev@unaligned-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147846v8/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg=
2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-=
dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-9/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-1/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +202 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_chamelium_color@ctm-gree=
n-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edi=
d-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_content_protection@lega=
cy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-3/igt@kms_c=
ursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@b=
-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-1/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_flip@flip-vs-s=
uspend@a-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sha=
rd-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +243 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_plane_multiple@2x-tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_psr2_sf@psr2-primary-pla=
ne-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_rotation_crc@sprite-rot=
ation-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +71 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@kms_scaling_modes@scaling-mo=
de-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_compute_preempt@compute-=
preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_eu_stall@blocking-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_eudebug@discovery-race-v=
mbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_eudebug_online@pagefault-w=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_evict@evict-small.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/261=
">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_balancer@twice-virt=
ual-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +249 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shar=
d-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_fault_mode@many-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_exec_system_allocator@man=
y-stride-free.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4915">Intel XE#4915</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-lnl-8/igt@xe_exec_system_allocator@once=
-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
46v8/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4929">Intel XE#4929</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_exec_system_allocator@tw=
ice-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_oa@invalid-oa-exponent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_peer2peer@write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061=
">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-5/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147846v8/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-1/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147846v8/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pxp@pxp-termination-key-u=
pdate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@fbdev@=
unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@fbdev@unaligne=
d-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147846v8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147846v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-4/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-7/igt@kms_flip@bloc=
king-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fl=
ip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@km=
s_flip@busy-flip.html">PASS</a> +108 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2=
-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@a-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sh=
ard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-move.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel X=
E#2050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147846v8/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-ind=
fb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-2/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +218 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466=
/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-b=
mg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed=
4364/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e539=
32ed4364/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550=
e53932ed4364/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c07=
9550e53932ed4364/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f73=
9c079550e53932ed4364/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d9=
5f739c079550e53932ed4364/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade=
97d95f739c079550e53932ed4364/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c=
6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f=
0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-=
986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed436=
4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147846v8/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_mod=
ule_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe=
_module_load@reload-no-display.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-adlp-2/igt@xe_pm@s4-d=
3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms=
_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shar=
d-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sha=
rd-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2=
-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard=
-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
46v8/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433=
/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147846v8/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
46v8/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-46=
4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846=
v8/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147846v8/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147846v8/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/=
shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2=
-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
46v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#434=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522=
">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-=
466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_chameli=
um_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_ch=
amelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-=
dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v=
8/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel=
 XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2=
-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-3/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_c=
ontent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-1/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/=
shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147846v8/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_ds=
c@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@k=
ms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-=
432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-46=
6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-2/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg=
-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-d=
g2-466/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147846v8/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1478=
46v8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/s=
hard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147846v8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846=
v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
846v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147846v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147846v8/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/=
igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +31 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-43=
2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sha=
rd-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pl=
ane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_plane_cu=
rsor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-bmg-7/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-=
433/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sh=
ard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#47=
60</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_p=
m_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_pr=
operties@get_properties-sanity-non-atomic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard=
-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/s=
hard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-=
dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt=
@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg=
2-466/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#92=
9</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-4=
64/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard=
-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-d=
g2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7846v8/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@kms_sc=
aling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt=
@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_sc=
aling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/sha=
rd-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@kms_wr=
iteback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147846v8/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb210101=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432=
/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_com=
pute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
846v8/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_eu_=
stall@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@xe_eu_sta=
ll@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eu_=
stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@x=
e_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_eud=
ebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg=
2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-=
dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel =
XE#4837</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147846v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr=
-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-d=
g2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47846v8/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@xe_exe=
c_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/s=
hard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +226 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_exec_system_allocator@threads-shar=
ed-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +204 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_oa@=
closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt=
@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shar=
d-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_pat@pat-i=
ndex-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-466/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pm@=
d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/igt@xe_pm@d3co=
ld-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-466/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-=
464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-432/=
igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-463/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-=
dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe=
_query@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-433/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147846v8/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-432/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel=
 XE#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147846v8/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprov=
ision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-464/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-463/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/shard-dg2-436/igt@xe_sri=
ov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/shard-dg2-464/=
igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364 -&gt; xe-pw-147=
846v8</li>
</ul>
<p>IGT_8361: 8361<br />
  xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364: 986f0a9c6ade97d95f739c0=
79550e53932ed4364<br />
  xe-pw-147846v8: 147846v8</p>

</body>
</html>

--===============0237398787978816871==--
