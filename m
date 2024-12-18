Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D47E7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 23:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4610E040;
	Wed, 18 Dec 2024 23:40:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CAB10E0DD;
 Wed, 18 Dec 2024 23:40:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6138765395727469911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improve_SRIOV_VRAM_provisi?=
 =?utf-8?q?oning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 23:40:15 -0000
Message-ID: <173456521507.212155.9336639051125998272@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218121837.226393-9-matthew.auld@intel.com>
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
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

--===============6138765395727469911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve SRIOV VRAM provisioning
URL   : https://patchwork.freedesktop.org/series/142782/
State : failure

== Summary ==

CI Bug Log - changes from xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c_full -> xe-pw-142782v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142782v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142782v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142782v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +16 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +6 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_exec_reset@cm-gt-reset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [PASS][6] -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][8] +2 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_pm_residency@cpg-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_eudebug@basic-vm-bind-ufence-reconnect}:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  
Known issues
------------

  Here are the changes found in xe-pw-142782v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1125])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3818]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3861])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         NOTRUN -> [WARN][17] ([Intel XE#3819])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [CRASH][18] ([Intel XE#3819]) +3 other tests crash
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3768])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#607])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1231])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#3818])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#1231]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#316]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2328])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#607])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#2191])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#367]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#367]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#787]) +13 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#3432]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#3862])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#787]) +35 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#1727]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2325])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_chamelium_color@degamma.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#306])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2252]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#373])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#373]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178]) +2 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#307])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#308])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#309])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#877]) +1 other test dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2374])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#3321]) +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#3321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301]) +4 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#2882]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#301])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#310]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2597])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][78] ([Intel XE#2597])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#886]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][81] -> [INCOMPLETE][82] ([Intel XE#2049] / [Intel XE#2597])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][85] -> [DMESG-FAIL][86] ([Intel XE#324]) +3 other tests dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#455]) +16 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#651])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +24 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#2333]) +5 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][91] ([Intel XE#1861])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][92] -> [FAIL][93] ([Intel XE#1861])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#651]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#651]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313]) +20 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#656]) +19 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2352])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#658])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#653]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2312]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1339])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2340])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][106] -> [INCOMPLETE][107] ([Intel XE#3663])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][108] -> [INCOMPLETE][109] ([Intel XE#1035]) +1 other test incomplete
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2493])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][111] -> [FAIL][112] ([Intel XE#361])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#718]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1129])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2505])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1439] / [Intel XE#836])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][119] -> [INCOMPLETE][120] ([Intel XE#2864])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-bmg:          [PASS][121] -> [INCOMPLETE][122] ([Intel XE#2864])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#1489]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2893])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1489]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1489])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1122]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.html
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2387])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2850] / [Intel XE#929])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][132] ([Intel XE#1874])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3414])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][134] -> [FAIL][135] ([Intel XE#899])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#2159]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1499])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#455]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#756])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2905])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2905]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2905]) +10 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2322]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1392]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#288]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#288]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2360]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2229])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174]) -> ([PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [SKIP][197], [PASS][198]) ([Intel XE#2457])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223]) -> ([PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [SKIP][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249]) ([Intel XE#378])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][251] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_pat@pat-index-xelp:
    - shard-adlp:         NOTRUN -> [TIMEOUT][252] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#2284])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [PASS][254] -> [DMESG-WARN][255] ([Intel XE#2953]) +1 other test dmesg-warn
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_pm@s2idle-mocs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [PASS][256] -> [INCOMPLETE][257] ([Intel XE#569]) +4 other tests incomplete
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [PASS][258] -> [INCOMPLETE][259] ([Intel XE#1358] / [Intel XE#569]) +2 other tests incomplete
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][260] ([Intel XE#569])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][261] -> [INCOMPLETE][262] ([Intel XE#569]) +2 other tests incomplete
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          [PASS][263] -> [INCOMPLETE][264] ([Intel XE#1607]) +1 other test incomplete
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         NOTRUN -> [SKIP][265] ([Intel XE#944])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][266] ([Intel XE#944])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#3342])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#3342])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-userptr-split-binds-16777216:
    - shard-adlp:         [PASS][269] -> [TIMEOUT][270] ([Intel XE#1033] / [Intel XE#1727]) +9 other tests timeout
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_vm@large-userptr-split-binds-16777216.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_vm@large-userptr-split-binds-16777216.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][271] ([Intel XE#1033]) -> [PASS][272] +2 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][273] ([Intel XE#3600]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][275] ([Intel XE#324]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [TIMEOUT][277] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][279] ([Intel XE#1242]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][281] -> [PASS][282] +2 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][283] ([Intel XE#2291]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][285] ([Intel XE#3070]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][287] ([Intel XE#2958]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#301]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][291] ([Intel XE#886]) -> [PASS][292] +2 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][293] ([Intel XE#1874]) -> [PASS][294] +1 other test pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [TIMEOUT][295] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][297] ([Intel XE#1861]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_mmap_write_crc@main:
    - shard-lnl:          [INCOMPLETE][299] -> [PASS][300] +1 other test pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-2/igt@kms_mmap_write_crc@main.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-8/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][301] ([Intel XE#2953]) -> [PASS][302] +10 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][303] ([Intel XE#361]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][305] ([Intel XE#2883]) -> [PASS][306] +3 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@kms_setmode@basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][307] ([Intel XE#2883]) -> [PASS][308] +2 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][309] ([Intel XE#899]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [INCOMPLETE][311] -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][313] ([Intel XE#1473]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [SKIP][315] ([Intel XE#1192]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][317] ([Intel XE#1192]) -> [PASS][318] +1 other test pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          [INCOMPLETE][319] ([Intel XE#1607]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][321] ([Intel XE#1794]) -> [PASS][322] +1 other test pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][323] ([Intel XE#1231]) -> [DMESG-FAIL][324] ([Intel XE#3818])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][325] ([Intel XE#2341]) -> [FAIL][326] ([Intel XE#1178])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_content_protection@legacy.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-adlp:         [SKIP][327] ([Intel XE#455]) -> [TIMEOUT][328] ([Intel XE#1033] / [Intel XE#1727])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_dsc@dsc-with-formats.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][329] ([Intel XE#2316]) -> [FAIL][330] ([Intel XE#2882])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [SKIP][331] ([Intel XE#2316]) -> [INCOMPLETE][332] ([Intel XE#2597])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][333] ([Intel XE#2312]) -> [SKIP][334] ([Intel XE#2311]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][335] ([Intel XE#1861]) -> [TIMEOUT][336] ([Intel XE#1033] / [Intel XE#1727])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [TIMEOUT][337] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][338] ([Intel XE#656])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][339] ([Intel XE#2312]) -> [FAIL][340] ([Intel XE#2333]) +3 other tests fail
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [FAIL][341] ([Intel XE#2333]) -> [SKIP][342] ([Intel XE#2312])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [TIMEOUT][343] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][344] ([Intel XE#651])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][345] ([Intel XE#2311]) -> [SKIP][346] ([Intel XE#2312])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][347] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][348] ([Intel XE#653])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][349] ([Intel XE#2312]) -> [SKIP][350] ([Intel XE#2313]) +5 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][351] ([Intel XE#656]) -> [TIMEOUT][352] ([Intel XE#1033] / [Intel XE#1727])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][353] ([Intel XE#734]) -> [FAIL][354] ([Intel XE#3325])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][355] ([Intel XE#3414]) -> [TIMEOUT][356] ([Intel XE#1033] / [Intel XE#1727])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [FAIL][357] ([Intel XE#1000]) -> [TIMEOUT][358] ([Intel XE#1473] / [Intel XE#2472])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][359] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][360] ([Intel XE#1392])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818
  [Intel XE#3819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3819
  [Intel XE#3861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3861
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8161 -> IGT_8162
  * Linux: xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c -> xe-pw-142782v1

  IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c
  xe-pw-142782v1: 142782v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/index.html

--===============6138765395727469911==
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
<tr><td><b>Series:</b></td><td>Improve SRIOV VRAM provisioning</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142782/">https://patchwork.freedesktop.org/series/142782/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142782v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142782v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d8=
20ba32c_full -&gt; xe-pw-142782v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142782v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142782v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1427=
82v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@flip-=
vs-suspend@a-hdmi-a6.html">INCOMPLETE</a> +16 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_exec_=
reset@cm-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.h=
tml">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.=
html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_pm@s4-multiple-execs.html"=
>DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_pm_residency@cpg-basic.htm=
l">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_eudebug@basic-vm-bind-ufence-reconnect}:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-uf=
ence-reconnect.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142782v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_async=
_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/sha=
rd-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-=
a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3818">Intel XE#3818</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_asyn=
c_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_async_f=
lips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3861">Intel XE#3861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_async_flips@crc-atomic.h=
tml">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3819">Intel XE#3819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@p=
ipe-d-hdmi-a-1.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3819">Intel XE#3819</a>) +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/sha=
rd-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3818">Intel XE#3818</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/s=
hard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-asy=
nc-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-mc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests s=
kip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 =
other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_chamelium_hpd@common-hp=
d-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_cursor_legacy@2x-cursor-=
vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt=
@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panni=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-=
vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@a=
b-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-7/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-2/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142782v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 o=
ther tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp=
-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">=
Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1339">Intel XE#1339</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-463/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@kms_pipe_crc_=
basic@suspend-read-crc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 =
other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#=
361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-6/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142782v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-5/igt@kms_pm_r=
pm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_pm_rpm@system-s=
uspend-modeset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_psr2_sf@psr2-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_psr@psr-cursor-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-=
rotation.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-6/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ex=
tended.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-met=
adata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_evict@evict-beng-large.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@xe_exec_fault_mode@many-exec=
queues-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_exec_fault_mode@once-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820b=
a32c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d=
820ba32c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb=
553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26=
e6fb553d820ba32c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a84=
1e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec343=
3a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38e=
c3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9=
b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0e=
f0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-=
1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142782v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142782v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
7">Intel XE#2457</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32=
c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d82=
0ba32c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb5=
53d820ba32c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26=
e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a8=
41e26e6fb553d820ba32c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3=
433a841e26e6fb553d820ba32c/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b=
38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0e=
f0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394=
-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32=
c/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d82=
0ba32c/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26e6fb5=
53d820ba32c/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a841e26=
e6fb553d820ba32c/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2394-1d0ef0c9b38ec3433a8=
41e26e6fb553d820ba32c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/=
shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
82v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142782v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142782v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/sh=
ard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142782v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42782v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Int=
el XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-463/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_pat@pat-index-xelp.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_pm@s=
2idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142782v1/shard-adlp-1/igt@xe_pm@s2idle-mocs.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"=
>Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_pm@s3=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/569">Intel XE#569</a>) +4 other tests incomplete</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-463/igt@xe_pm@=
s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-ex=
ec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +2 other tests incomplete=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@xe_pm@s3-exec-after.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@xe_pm@=
s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbi=
nd-all.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/569">Intel XE#569</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142782v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1607">Intel XE#1607</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-adlp-2/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@xe_vm@l=
arge-userptr-split-binds-16777216.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@xe_vm@larg=
e-userptr-split-binds-16777216.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>=
) +9 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-=
adlp-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600">Intel XE#36=
00</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2782v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-a=
sync-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142782v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_big_fb@x-tiled=
-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel=
 XE#1242</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142782v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_cu=
rsor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard=
-dg2-463/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-6.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-3/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-7/igt@kms_fbco=
n_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-4/igt@kms_fbcon_fbt=
@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard=
-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-8/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-6/igt@kms_fl=
ip@wf_vblank-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
82v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#=
1861</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142782v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-2/igt@kms_mmap=
_write_crc@main.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-8/igt@kms_mmap_write_crc@main=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/sha=
rd-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +=
10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-436/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-=
dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-1/igt@kms_setmode@basic.htm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl=
-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-3/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/=
shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vra=
m01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-dg2-433/igt@xe_evi=
ct@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-dg2-=
463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-lnl-4/igt@xe_live_=
ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-lnl-2/igt@xe_live_ktest@=
xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-7/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-5/igt@xe_live_ktest@=
xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-9/igt@xe_pm@s=
4-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@xe_pm@s4-mocs.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142782v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3818">Intel XE#3818</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-7/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_dsc=
@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-6/igt@kms_dsc@dsc-wi=
th-formats.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-2/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@kms_flip@2x=
-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#=
1861</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142782v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrf=
b-draw-render.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142782v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2782v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1=
/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Int=
el XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
82v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Int=
el XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142782v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142782v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782=
v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-b=
lt.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-4/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-2/igt@kms_rot=
ation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-adlp-4/igt@k=
ms_rotation_crc@sprite-rotation-90.html">TIMEOUT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-bmg-6/igt@xe_evict=
@evict-mixed-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v1/shard-bmg-8/igt@xe_e=
vict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c/shard-adlp-8/igt@xe_exec=
_basic@multigpu-once-userptr-invalidate-race.html">TIMEOUT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142782v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8161 -&gt; IGT_8162</li>
<li>Linux: xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c -&gt; xe-pw-142=
782v1</li>
</ul>
<p>IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8162: 8bce68b09c45753b5237edc2f65497969a05f881 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e2=
6e6fb553d820ba32c<br />
  xe-pw-142782v1: 142782v1</p>

</body>
</html>

--===============6138765395727469911==--
