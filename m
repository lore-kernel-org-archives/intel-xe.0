Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E5EC71135
	for <intel-xe@archiver.kernel.org>; Sun, 15 Jun 2025 20:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB10C10E22F;
	Sun, 15 Jun 2025 20:06:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7610E07A;
 Sun, 15 Jun 2025 20:06:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0162639335078622421=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_WildCat_Lake_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 15 Jun 2025 20:06:22 -0000
Message-ID: <175001798264.80433.15695367238368136170@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

--===============0162639335078622421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add WildCat Lake support
URL   : https://patchwork.freedesktop.org/series/150255/
State : failure

== Summary ==

CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_FULL -> xe-pw-150255v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150255v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150255v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150255v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html

  
#### Warnings ####

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [ABORT][3] ([Intel XE#5214]) -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
Known issues
------------

  Here are the changes found in xe-pw-150255v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2351] / [Intel XE#4208])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#610])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +13 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#1727] / [Intel XE#3113])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#4208]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_cdclk@mode-transition.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#4417]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2325])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1188]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2321])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2286])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4156])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#2882])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#886]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#301] / [Intel XE#3321])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301]) +5 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#2882]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#651]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4141]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#653]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2313]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#1503]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_hdr@static-swap.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2925])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2927])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-get:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_lease@lease-get.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_lease@lease-get.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#5021])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4208] / [i915#2575]) +19 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#3309])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1489])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1122])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1127])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1435])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4837]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4837]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4208]) +104 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#288]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4943]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#5018]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#4915]) +37 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113]) -> ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [SKIP][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138]) ([Intel XE#378])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-lnl:          [PASS][139] -> [INCOMPLETE][140] ([Intel XE#2594])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-4/igt@xe_oa@create-destroy-userspace-config.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-lnl-3/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2284] / [Intel XE#366])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][143] -> [INCOMPLETE][144] ([Intel XE#569]) +1 other test incomplete
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][145] -> [ABORT][146] ([Intel XE#1794])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s4-vm-bind-userptr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pmu@gt-frequency:
    - shard-adlp:         NOTRUN -> [ABORT][147] ([Intel XE#5214]) +1 other test abort
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4733]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#3342])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-adlp:         [SKIP][150] ([Intel XE#4950]) -> [PASS][151] +18 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-63.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][152] ([Intel XE#4543]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][154] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][160] ([Intel XE#2291]) -> [PASS][161] +2 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][162] ([Intel XE#2316]) -> [PASS][163] +5 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [SKIP][164] ([Intel XE#4947]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][166] ([Intel XE#1503]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][168] ([Intel XE#1435]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][170] ([Intel XE#1499]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute}:
    - shard-bmg:          [ABORT][172] ([Intel XE#3970]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - shard-bmg:          [FAIL][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][176] -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][178] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s2idle-basic.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [INCOMPLETE][180] ([Intel XE#569]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [SKIP][182] ([Intel XE#4945]) -> [PASS][183] +29 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_vm@large-misaligned-binds-2147483648.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [SKIP][184] ([Intel XE#4963]) -> [DMESG-WARN][185] ([Intel XE#2953] / [Intel XE#4173])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-adlp:         [SKIP][186] ([Intel XE#4947]) -> [SKIP][187] ([Intel XE#1124])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][188] ([Intel XE#4947]) -> [SKIP][189] ([Intel XE#316]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         [SKIP][190] ([Intel XE#4947]) -> [SKIP][191] ([Intel XE#610])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][192] ([Intel XE#4950]) -> [SKIP][193] ([Intel XE#367])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][194] ([Intel XE#4947]) -> [SKIP][195] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#2907]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][199] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         [SKIP][200] ([Intel XE#4947]) -> [SKIP][201] ([Intel XE#4417] / [Intel XE#455])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cdclk@mode-transition.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][202] ([Intel XE#4950]) -> [SKIP][203] ([Intel XE#373])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#373]) -> [SKIP][205] ([Intel XE#4208] / [i915#2575])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][206] ([Intel XE#1178]) -> [SKIP][207] ([Intel XE#2341])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][208] ([Intel XE#2341]) -> [FAIL][209] ([Intel XE#1178])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_content_protection@srm.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         [SKIP][210] ([Intel XE#4947]) -> [SKIP][211] ([Intel XE#776])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fbcon_fbt@psr.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         [SKIP][212] ([Intel XE#4950]) -> [SKIP][213] ([Intel XE#310]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         [SKIP][214] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][215] ([Intel XE#455])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#455]) -> [SKIP][217] ([Intel XE#2351] / [Intel XE#4208])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-adlp:         [SKIP][218] ([Intel XE#4947]) -> [SKIP][219] ([Intel XE#455]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][220] ([Intel XE#4947]) -> [SKIP][221] ([Intel XE#651]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][222] ([Intel XE#2311]) -> [SKIP][223] ([Intel XE#2312]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][224] ([Intel XE#2312]) -> [SKIP][225] ([Intel XE#2311]) +11 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][226] ([Intel XE#4947]) -> [SKIP][227] ([Intel XE#656]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [INCOMPLETE][228] ([Intel XE#4842]) -> [SKIP][229] ([Intel XE#4208])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][230] ([Intel XE#4141]) -> [SKIP][231] ([Intel XE#2312]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][232] ([Intel XE#2312]) -> [SKIP][233] ([Intel XE#4141]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][234] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][235] ([Intel XE#651])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#651]) -> [SKIP][237] ([Intel XE#2351] / [Intel XE#4208])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][238] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][239] ([Intel XE#656]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#653]) -> [SKIP][241] ([Intel XE#2351] / [Intel XE#4208])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][242] ([Intel XE#4947]) -> [SKIP][243] ([Intel XE#653]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][244] ([Intel XE#2312]) -> [SKIP][245] ([Intel XE#2313]) +8 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][246] ([Intel XE#2313]) -> [SKIP][247] ([Intel XE#2312]) +9 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [SKIP][248] ([Intel XE#4950]) -> [SKIP][249] ([Intel XE#455]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#1489])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][252] ([Intel XE#4947]) -> [SKIP][253] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-render:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][255] ([Intel XE#4208])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_psr@psr-sprite-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][256] ([Intel XE#4950]) -> [SKIP][257] ([Intel XE#1127])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         [SKIP][258] ([Intel XE#4945]) -> [SKIP][259] ([Intel XE#455] / [Intel XE#488])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_ccs@suspend-resume.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         [SKIP][260] ([Intel XE#4945]) -> [SKIP][261] ([Intel XE#4837]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_eudebug@read-metadata.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         [SKIP][262] ([Intel XE#4945]) -> [SKIP][263] ([Intel XE#261] / [Intel XE#688])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_evict@evict-large-cm.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][264] ([Intel XE#4945]) -> [SKIP][265] ([Intel XE#288]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#288]) -> [SKIP][267] ([Intel XE#4208])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         [SKIP][268] ([Intel XE#4945]) -> [SKIP][269] ([Intel XE#4915]) +60 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4915]) -> [SKIP][271] ([Intel XE#4208]) +14 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         [SKIP][272] ([Intel XE#4945]) -> [SKIP][273] ([Intel XE#2541] / [Intel XE#3573])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@non-privileged-map-oa-buffer.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][275] ([Intel XE#4208])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html
    - shard-adlp:         [SKIP][276] ([Intel XE#4945]) -> [SKIP][277] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@syncs-ufence-wait-cfg.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
    - shard-adlp:         [SKIP][280] ([Intel XE#4945]) -> [SKIP][281] ([Intel XE#2284] / [Intel XE#366])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@engine-activity-all-load-idle:
    - shard-adlp:         [DMESG-WARN][282] ([Intel XE#5214]) -> [ABORT][283] ([Intel XE#5214]) +4 other tests abort
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_pmu@engine-activity-all-load-idle.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-4/igt@xe_pmu@engine-activity-all-load-idle.html

  * igt@xe_pmu@engine-activity-load:
    - shard-adlp:         [ABORT][284] ([Intel XE#5214]) -> [DMESG-WARN][285] ([Intel XE#5214]) +1 other test dmesg-warn
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pmu@engine-activity-load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-2/igt@xe_pmu@engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][286] ([Intel XE#4835]) -> [FAIL][287] ([Intel XE#4819]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         [SKIP][288] ([Intel XE#4945]) -> [SKIP][289] ([Intel XE#4733])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         [SKIP][290] ([Intel XE#4945]) -> [SKIP][291] ([Intel XE#944])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_query@multigpu-query-gt-list.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#944]) -> [SKIP][293] ([Intel XE#4208])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-adlp:         [SKIP][294] ([Intel XE#4945]) -> [SKIP][295] ([Intel XE#4821])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_spin_batch@spin-mem-copy.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_spin_batch@spin-mem-copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-pw-150255v1

  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895331224e057508c07a
  xe-pw-150255v1: 150255v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/index.html

--===============0162639335078622421==
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
<tr><td><b>Series:</b></td><td>Add WildCat Lake support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150255/">https://patchwork.freedesktop.org/series/150255/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150255v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150255v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057=
508c07a_FULL -&gt; xe-pw-150255v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150255v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150255v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1502=
55v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@kms_f=
lip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#521=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
255v1/shard-adlp-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-=
random.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150255v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-=
dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-t=
iled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_cd=
clk@mode-transition.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_cdclk@mode-transiti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_flip=
@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@kms_fli=
p@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436=
/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel X=
E#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@kms_f=
lip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-7/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_=
flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_le=
ase@lease-get.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_lease@lease-get.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_plane_scaling@plane-ups=
cale-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
+19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr@pr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ex=
tended-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_basic@no-exec-binde=
xecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#494=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150255v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 o=
ther test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_exec_system_allocator@tw=
ice-mmap-remap-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +37 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard=
-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e0575=
08c07a/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc389533122=
4e057508c07a/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc38=
95331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e=
0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e6=
02638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d0=
16d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-32=
52-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508=
c07a/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e=
057508c07a/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc38953=
31224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0eb=
c3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e6026=
38e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d=
6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-=
4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50255v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/=
shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150255v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2=
-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150255v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378=
">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-4/igt@xe_oa@cr=
eate-destroy-userspace-config.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-lnl-3/igt@xe_oa@create-de=
stroy-userspace-config.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-e=
xec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150255v1/shard-bmg-6/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE=
#569</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pmu@gt-frequency.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/521=
4">Intel XE#5214</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_add=
fb_basic@bad-pitch-63.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_addf=
b_basic@bad-pitch-63.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150255v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b=
-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150255v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-=
hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@k=
ms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_hdr@static-to=
ggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-4/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_en=
gine_class_compute}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_compu=
te_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compu=
te.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3970">Intel XE#3970</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_compute_preempt@compute-=
preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemse=
t:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1=
/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unm=
ap-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_exe=
c_threads@threads-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2=
-435/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s=
2idle-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/i=
gt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3=
-vm-bind-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_pm@s3-v=
m-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_vm@l=
arge-misaligned-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/i=
gt@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +29 other tests p=
ass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@core_ho=
tunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@co=
re_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@k=
ms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms=
_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/i=
gt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_bw@=
linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-=
6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs=
@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-=
adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-=
adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel =
XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cdc=
lk@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@m=
ode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_cha=
melium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/i=
gt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_ch=
amelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/=
igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fbc=
on_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@=
kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150255v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150255v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel X=
E#4842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
7">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-s=
cndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150255v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
255v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50255v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1502=
55v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_pla=
ne_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@=
kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr=
2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/=
shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_psr=
@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_=
psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_ps=
r@psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/=
igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_rot=
ation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-a=
dlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE=
#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_ccs@=
suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_ccs@suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_eude=
bug@read-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_eudebug@r=
ead-metadata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_evic=
t@evict-large-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_evict@evic=
t-large-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adl=
p-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-=
436/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_exec=
_system_allocator@processes-evict-malloc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-=
adlp-6/igt@xe_exec_system_allocator@processes-evict-malloc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel =
XE#4915</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-mlock.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v=
1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@n=
on-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe=
_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1502=
55v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_oa@s=
yncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_oa@syn=
cs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pm@d=
3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pm@d3cold-m=
map-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-all-load-idle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_pmu@=
engine-activity-all-load-idle.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-=
4/igt@xe_pmu@engine-activity-all-load-idle.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) +4=
 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pmu@=
engine-activity-load.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-2/igt@xe_pmu@e=
ngine-activity-load.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) +1 other test dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4835">Intel XE#4835</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/igt@xe_pmu@gt-frequ=
ency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_pxp@=
display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pxp@display-=
pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_quer=
y@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_qu=
ery@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_que=
ry@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_qu=
ery@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_spin_b=
atch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -&gt; xe-pw-150=
255v1</li>
</ul>
<p>IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895=
331224e057508c07a<br />
  xe-pw-150255v1: 150255v1</p>

</body>
</html>

--===============0162639335078622421==--
