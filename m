Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8299FC83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 21:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B43F10E86A;
	Wed,  9 Jul 2025 21:04:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283610E869;
 Wed,  9 Jul 2025 21:04:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3032644110490373021=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Expose_fan_contr?=
 =?utf-8?q?ol_and_voltage_regulator_version_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Jul 2025 21:04:29 -0000
Message-ID: <175209506964.149137.14631491293640328920@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250709164224.2676086-1-raag.jadav@intel.com>
In-Reply-To: <20250709164224.2676086-1-raag.jadav@intel.com>
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

--===============3032644110490373021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Expose fan control and voltage regulator version (rev2)
URL   : https://patchwork.freedesktop.org/series/151402/
State : failure

== Summary ==

CI Bug Log - changes from xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6_FULL -> xe-pw-151402v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151402v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151402v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151402v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  
Known issues
------------

  Here are the changes found in xe-pw-151402v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#4208])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@intel_sysfs_debugfs@xe-forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#3157])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][10] -> [FAIL][11] ([Intel XE#827]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#4208] / [i915#2575]) +23 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_async_flips@test-cursor.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#3908]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4543])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +139 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][27] ([Intel XE#1727] / [Intel XE#3113])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#3124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4417]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#3304])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2291])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2291]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#4633]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#2953] / [Intel XE#4173])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-9/igt@kms_cursor_legacy@torture-bo.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-1/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2374])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2316])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#4543]) +2 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#301]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][55] -> [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#651])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#656]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2312]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5390]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2311]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#346])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#616])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#4596]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4208] / [i915#2575]) +15 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2391])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1122])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1489])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#3414] / [Intel XE#3904])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][79] -> [FAIL][80] ([Intel XE#2883]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2883])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][83] -> [INCOMPLETE][84] ([Intel XE#4488]) +1 other test incomplete
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#2142]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1499])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1126])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4837]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#4837]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4518])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#688])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#4208]) +75 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#1392]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#288]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][98] -> [DMESG-WARN][99] ([Intel XE#4812])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#4915]) +24 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4208]) +74 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#5018])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4943]) +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2248])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@stress-open-close:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_oa@stress-open-close.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2236])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2284])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#569])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4733])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#4130])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][113] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][116] +8 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][119] ([Intel XE#2291]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][121] ([Intel XE#4354]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][123] ([Intel XE#2316]) -> [PASS][124] +10 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][125] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][127] ([Intel XE#301]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#4543]) -> [PASS][132] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][133] ([Intel XE#4596]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#4208] / [i915#2575]) -> [PASS][136] +48 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_vblank@accuracy-idle.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][137] ([Intel XE#1499]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1392]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][141] ([Intel XE#3868]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - shard-bmg:          [FAIL][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][146] +14 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208]) -> [PASS][148] +99 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm_residency@idle-residency:
    - shard-adlp:         [FAIL][149] -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@xe_pm_residency@idle-residency.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-2/igt@xe_pm_residency@idle-residency.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#316]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#316]) -> [SKIP][154] ([Intel XE#4208])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][156] ([Intel XE#1124])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1124]) -> [SKIP][158] ([Intel XE#4208])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#4208]) -> [SKIP][160] ([Intel XE#1124]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][162] ([Intel XE#619])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#4208]) -> [SKIP][164] ([Intel XE#610])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1124]) -> [SKIP][166] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#4208] / [i915#2575]) -> [SKIP][168] ([Intel XE#2191])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4208] / [i915#2575]) -> [SKIP][170] ([Intel XE#367])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#367]) -> [SKIP][172] ([Intel XE#4208] / [i915#2575])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2907]) -> [SKIP][174] ([Intel XE#4208])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208]) -> [SKIP][176] ([Intel XE#2907])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][178] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][182] ([Intel XE#4208]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#4208]) -> [SKIP][184] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][186] ([Intel XE#2231] / [Intel XE#4208])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][188] ([Intel XE#4418])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#306]) -> [SKIP][190] ([Intel XE#4208] / [i915#2575])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#4208] / [i915#2575]) -> [SKIP][192] ([Intel XE#373]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#373]) -> [SKIP][194] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][195] ([Intel XE#2341]) -> [FAIL][196] ([Intel XE#1178])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_content_protection@atomic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#307]) -> [SKIP][198] ([Intel XE#4208] / [i915#2575])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4208] / [i915#2575]) -> [SKIP][200] ([Intel XE#307])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208] / [i915#2575]) -> [FAIL][202] ([Intel XE#1178])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][203] ([Intel XE#1178]) -> [SKIP][204] ([Intel XE#2341])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#4208] / [i915#2575]) -> [SKIP][206] ([Intel XE#308])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#308]) -> [SKIP][208] ([Intel XE#4208] / [i915#2575])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#455]) -> [SKIP][210] ([Intel XE#4208]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#4208]) -> [SKIP][212] ([Intel XE#4354])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#455]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#4208])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#776]) -> [SKIP][216] ([Intel XE#4208])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fbcon_fbt@psr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][218] ([Intel XE#4208] / [i915#2575])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][220] ([Intel XE#455])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208]) -> [SKIP][222] ([Intel XE#455]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2311]) +17 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#2312]) +13 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#651]) -> [SKIP][228] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#651]) +10 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [SKIP][232] ([Intel XE#5390]) +6 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][233] ([Intel XE#5390]) -> [SKIP][234] ([Intel XE#2312]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#651]) -> [SKIP][236] ([Intel XE#4208]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][238] ([Intel XE#651]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][240] ([Intel XE#658])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#653]) -> [SKIP][242] ([Intel XE#4208]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][243] ([Intel XE#2313]) -> [SKIP][244] ([Intel XE#2312]) +14 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][246] ([Intel XE#653]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#653]) +10 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#653]) -> [SKIP][250] ([Intel XE#2351] / [Intel XE#4208])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][251] ([Intel XE#2312]) -> [SKIP][252] ([Intel XE#2313]) +19 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][253] ([Intel XE#3544]) -> [SKIP][254] ([Intel XE#3374] / [Intel XE#3544])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#356]) -> [SKIP][256] ([Intel XE#4208] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][257] ([Intel XE#4596]) -> [SKIP][258] ([Intel XE#5021])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#5021]) -> [SKIP][260] ([Intel XE#4208] / [i915#2575])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2938]) -> [SKIP][262] ([Intel XE#4208])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#870]) -> [SKIP][264] ([Intel XE#2231] / [Intel XE#4208])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][266] ([Intel XE#1122])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1489]) -> [SKIP][268] ([Intel XE#2231] / [Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1489]) -> [SKIP][270] ([Intel XE#4208]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#1489]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#4208]) -> [SKIP][274] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][276] ([Intel XE#4208]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][278] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_psr@pr-sprite-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#3414]) -> [SKIP][280] ([Intel XE#4208] / [i915#2575])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#455]) -> [SKIP][282] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4208] / [i915#2575]) -> [SKIP][284] ([Intel XE#455]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_vrr@flipline.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#1126]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#5419]) -> [SKIP][288] ([Intel XE#4208])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#4208]) -> [SKIP][290] ([Intel XE#5419])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#4837]) +6 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4837]) -> [SKIP][294] ([Intel XE#4208]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_eudebug_online@reset-with-attention.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#288]) -> [SKIP][296] ([Intel XE#4208]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#288]) +11 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2360]) -> [SKIP][300] ([Intel XE#4208])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#4915]) +135 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4915]) -> [SKIP][304] ([Intel XE#4208]) +90 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][305] ([Intel XE#5018]) -> [FAIL][306] ([Intel XE#4937])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4208]) -> [SKIP][308] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_oa@disabled-read-error.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][310] ([Intel XE#4208])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][314] ([Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_oa@syncs-userptr-wait.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([Intel XE#979])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#4650])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pmu@fn-engine-activity-load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#4208]) -> [SKIP][320] ([Intel XE#4733]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#944]) -> [SKIP][322] ([Intel XE#4208])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_query@multigpu-query-mem-usage.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#944]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208]) -> [SKIP][326] ([Intel XE#4130])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4130]) -> [SKIP][328] ([Intel XE#4208]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6 -> xe-pw-151402v2

  IGT_8447: 8447
  xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6: 8cbc0224847589e88bb3ea0c00952c51e00f5bd6
  xe-pw-151402v2: 151402v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/index.html

--===============3032644110490373021==
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
<tr><td><b>Series:</b></td><td>drm/xe: Expose fan control and voltage regul=
ator version (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151402/">https://patchwork.freedesktop.org/series/151402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151402v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151402v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3384-8cbc0224847589e88bb3ea0c00952c51e=
00f5bd6_FULL -&gt; xe-pw-151402v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151402v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151402v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1514=
02v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_pm_r=
pm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_pm_rpm@system-s=
uspend-modeset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@xe_exec_=
threads@threads-hang-userptr-rebind-err.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-2/igt@xe_ex=
ec_threads@threads-hang-userptr-rebind-err.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151402v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@core_s=
etmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@core_setmaste=
r@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@intel_=
sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@intel_sysfs_debu=
gfs@xe-forcewake.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-9/igt@kms_async=
_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_as=
ync_flips@test-cursor.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_async_flips@test-=
cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test =
skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-434/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-=
movement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-9/igt@kms_cur=
sor_legacy@torture-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-1/igt@kms_cursor_legacy@tort=
ure-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-6/igt@kms_flip@basic-=
plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/sha=
rd-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_plane_scaling@plane-sca=
ler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@kms_set=
mode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151402v2/shard-adlp-6/igt@kms_setmode@basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel=
 XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_setm=
ode@basic@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_setmode@basic@p=
ipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-7/igt@kms_vbla=
nk@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-6/igt@kms_vblank@ts-cont=
inuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-lnl-2/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-met=
adata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_exec_fault_mode@once-user=
ptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-6/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-8/igt@xe_exec_reset@gt-rese=
t-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4812">Intel XE#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +24 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_system_allocator@pr=
ocess-many-large-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +74 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2=
/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues=
-new-bo-map.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_oa@stress-open-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@xe_pm@s=
3-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151402v2/shard-adlp-3/igt@xe_pm@s3-vm-bind-prefetch=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151402v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg=
-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +10 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v=
2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-4/=
igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +5 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_vb=
lank@accuracy-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/=
igt@kms_vblank@accuracy-idle.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-4/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151402v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@xe_exec=
_reset@cm-close-fd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-2/igt@xe_ex=
ec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@xe_exec_=
system_allocator@process-many-malloc-bo-unmap.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/ig=
t@xe_exec_system_allocator@process-many-malloc-bo-unmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-8/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp=
-3/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pm@=
s2idle-exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_pm@s2idl=
e-exec-after.html">PASS</a> +99 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-adlp-3/igt@xe_pm_r=
esidency@idle-residency.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151402v2/shard-adlp-2/igt@xe_pm_residency@idle=
-residency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bi=
g_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@=
kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_bi=
g_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@km=
s_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-=
dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@=
kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard=
-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433=
/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151402v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151402v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_bw=
@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_bw=
@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-46=
4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shar=
d-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151402v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
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
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/=
shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-=
dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4=
418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ch=
amelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151402v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibe=
rnate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ch=
amelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard=
-dg2-464/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@=
kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/sh=
ard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard=
-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-5/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/=
shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-=
464/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_di=
rtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_di=
rtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ds=
c@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@k=
ms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard=
-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151402v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp=
-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151402v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/sha=
rd-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">I=
ntel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51402v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51402v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151402v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151402v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15140=
2v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151402v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151402v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-3/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg=
2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-432/igt@kms_p=
m_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg=
2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
402v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-ex=
ceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-4=
64/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ps=
r@fbc-psr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@kms_p=
sr@fbc-psr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard=
-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_ps=
r@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/=
igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@k=
ms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@kms_sc=
aling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-46=
4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5419">Intel XE#5419</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_eu_sta=
ll@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_eu_=
stall@non-blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-435/igt@=
xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_eud=
ebug_online@preempt-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/=
igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_eud=
ebug_online@reset-with-attention.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/=
igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
02v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151402v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-=
rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_exe=
c_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/s=
hard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
15">Intel XE#4915</a>) +135 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151402v2/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#=
4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_oa@=
disabled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_oa@dis=
abled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_oa@=
invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464=
/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_oa@s=
yncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_oa@=
syncs-userptr-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/=
shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-433/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-436/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-464/igt@xe_=
query@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-4=
35/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2-=
436/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6/shard-dg2-463/igt@xe_sri=
ov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151402v2/shard-dg2=
-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6 -&gt; xe-pw-151=
402v2</li>
</ul>
<p>IGT_8447: 8447<br />
  xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6: 8cbc0224847589e88bb3ea0=
c00952c51e00f5bd6<br />
  xe-pw-151402v2: 151402v2</p>

</body>
</html>

--===============3032644110490373021==--
