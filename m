Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE47EC87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 12:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7152710E1F8;
	Tue, 29 Jul 2025 12:25:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999BA10E1F5;
 Tue, 29 Jul 2025 12:25:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1759639388944981533=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Fix_VM_crash_?=
 =?utf-8?q?during_VF_driver_release_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 12:25:05 -0000
Message-ID: <175379190561.196634.8487122031384995210@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729064317.28366-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250729064317.28366-1-satyanarayana.k.v.p@intel.com>
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

--===============1759639388944981533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fix VM crash during VF driver release (rev3)
URL   : https://patchwork.freedesktop.org/series/152142/
State : failure

== Summary ==

CI Bug Log - changes from xe-3481-91d0354204f2eb9c627499de521b4469330408b9_FULL -> xe-pw-152142v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152142v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152142v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152142v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - shard-lnl:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

  
Known issues
------------

  Here are the changes found in xe-pw-152142v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#4963]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#4674])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2134])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@fbdev@info.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#911]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#4947]) +21 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#4543])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +132 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1178])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1188])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#4354])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#776])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2316]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4950]) +112 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-3/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-9/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#301]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][50] -> [ABORT][51] ([Intel XE#4056]) +1 other test abort
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3098]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_event_leak@basic:
    - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_flip_event_leak@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-6/igt@kms_flip_event_leak@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#5390])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4950]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4962])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#4962]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4947]) +18 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2850] / [Intel XE#929])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#3414])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#455])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2413])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#1435]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#1392]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3868])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-6/igt@xe_exec_reset@cm-close-fd.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4915]) +17 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#5018])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4943])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#4937])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][79] -> [DMESG-WARN][80] ([Intel XE#3876])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#4208]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4945]) +47 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][84] -> [FAIL][85] ([Intel XE#5679])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_module_load@many-reload.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#3573])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][87] -> [FAIL][88] ([Intel XE#4819]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-466/igt@xe_pmu@gt-frequency.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#4945]) +570 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_spin_batch@spin-all.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][91] ([Intel XE#4543]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][93] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][95] ([Intel XE#2291]) -> [PASS][96] +2 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][97] ([Intel XE#1340]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][99] ([Intel XE#2316]) -> [PASS][100] +4 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][101] ([Intel XE#301]) -> [PASS][102] +2 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#5208]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][105] ([Intel XE#4543]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][109] ([Intel XE#616]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][111] ([Intel XE#4596]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [DMESG-FAIL][113] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-9/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [DMESG-WARN][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][117] ([Intel XE#1499]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:
    - shard-bmg:          [TIMEOUT][119] ([Intel XE#5213]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1392]) -> [PASS][122] +6 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][123] ([Intel XE#3876]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][126] +9 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-3/igt@xe_pm@d3hot-mmap-system.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-3/igt@xe_pm@d3hot-mmap-system.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][127] ([Intel XE#2327]) -> [SKIP][128] ([Intel XE#4947]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][129] ([Intel XE#1124]) -> [SKIP][130] ([Intel XE#4947]) +17 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1124]) -> [SKIP][132] ([Intel XE#4208])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][133] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][134] ([Intel XE#4950])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][135] ([Intel XE#367]) -> [SKIP][136] ([Intel XE#4950]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][138] ([Intel XE#4208])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][139] ([Intel XE#3432]) -> [SKIP][140] ([Intel XE#4947]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][141] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#4947]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][143] ([Intel XE#2887]) -> [SKIP][144] ([Intel XE#4947]) +17 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][146] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][147] ([Intel XE#2724]) -> [SKIP][148] ([Intel XE#4947])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_cdclk@mode-transition.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][149] ([Intel XE#2325]) -> [SKIP][150] ([Intel XE#4950]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][151] ([Intel XE#2252]) -> [SKIP][152] ([Intel XE#4950]) +11 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#4208] / [i915#2575])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][155] ([Intel XE#2341]) -> [SKIP][156] ([Intel XE#4950]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][157] ([Intel XE#2390]) -> [SKIP][158] ([Intel XE#4950])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][159] ([Intel XE#1178]) -> [SKIP][160] ([Intel XE#2341]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][161] ([Intel XE#2341]) -> [FAIL][162] ([Intel XE#1178])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_content_protection@srm.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][163] ([Intel XE#1188]) -> [SKIP][164] ([Intel XE#2341])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_content_protection@uevent.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][165] ([Intel XE#2320]) -> [SKIP][166] ([Intel XE#4950]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][167] ([Intel XE#2321]) -> [SKIP][168] ([Intel XE#4950])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][169] ([Intel XE#5354]) -> [SKIP][170] ([Intel XE#4950])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][171] ([Intel XE#4633]) -> [SKIP][172] ([Intel XE#4950])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][173] ([Intel XE#4354]) -> [SKIP][174] ([Intel XE#4947])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][175] ([Intel XE#2244]) -> [SKIP][176] ([Intel XE#4947]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][177] ([Intel XE#5425]) -> [SKIP][178] ([Intel XE#4947])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][179] ([Intel XE#2372]) -> [SKIP][180] ([Intel XE#4950])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][181] ([Intel XE#2316]) -> [SKIP][182] ([Intel XE#4950]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][183] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][184] ([Intel XE#4947]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#4208])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][187] ([Intel XE#2312]) -> [SKIP][188] ([Intel XE#2311]) +18 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][189] ([Intel XE#2311]) -> [SKIP][190] ([Intel XE#2312]) +20 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][191] ([Intel XE#2311]) -> [SKIP][192] ([Intel XE#4947]) +34 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][193] ([Intel XE#2312]) -> [SKIP][194] ([Intel XE#5390]) +8 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][195] ([Intel XE#5390]) -> [SKIP][196] ([Intel XE#2312]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][197] ([Intel XE#5390]) -> [SKIP][198] ([Intel XE#4947]) +18 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][199] ([Intel XE#2352]) -> [SKIP][200] ([Intel XE#4947])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][201] ([Intel XE#2312]) -> [SKIP][202] ([Intel XE#2313]) +17 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#2313]) -> [SKIP][204] ([Intel XE#2312]) +19 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][205] ([Intel XE#2313]) -> [SKIP][206] ([Intel XE#4947]) +36 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][207] ([Intel XE#2350]) -> [SKIP][208] ([Intel XE#4947])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#4947]) +7 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#653]) -> [SKIP][212] ([Intel XE#2351] / [Intel XE#4208])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#2594]) -> [SKIP][214] ([Intel XE#653])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][215] ([Intel XE#3544]) -> [SKIP][216] ([Intel XE#3374] / [Intel XE#3544])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][217] ([Intel XE#346]) -> [SKIP][218] ([Intel XE#4947])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][219] ([Intel XE#2927]) -> [SKIP][220] ([Intel XE#4947])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][221] ([Intel XE#5021]) -> [SKIP][222] ([Intel XE#4596])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][223] ([Intel XE#2763]) -> [SKIP][224] ([Intel XE#4950]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][225] ([Intel XE#870]) -> [SKIP][226] ([Intel XE#4947])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_pm_backlight@fade.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][227] ([Intel XE#2499]) -> [SKIP][228] ([Intel XE#4947])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][229] ([Intel XE#1489]) -> [SKIP][230] ([Intel XE#4947]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1489]) -> [SKIP][232] ([Intel XE#4208])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][233] ([Intel XE#2387]) -> [SKIP][234] ([Intel XE#4947])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][235] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][236] ([Intel XE#4947]) +19 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][237] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][238] ([Intel XE#4950]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][239] ([Intel XE#2330]) -> [SKIP][240] ([Intel XE#4950])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][241] ([Intel XE#1435]) -> [SKIP][242] ([Intel XE#4950])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][243] ([Intel XE#2509]) -> [SKIP][244] ([Intel XE#2426])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][245] ([Intel XE#1499]) -> [SKIP][246] ([Intel XE#4950]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_vrr@flipline.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][247] ([Intel XE#2168]) -> [SKIP][248] ([Intel XE#4950])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_vrr@lobf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4837]) -> [SKIP][250] ([Intel XE#4208])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          [SKIP][251] ([Intel XE#4837]) -> [SKIP][252] ([Intel XE#4945]) +16 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][253] ([Intel XE#4518]) -> [SKIP][254] ([Intel XE#4945])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][255] ([Intel XE#2322]) -> [SKIP][256] ([Intel XE#4945]) +11 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][257] ([Intel XE#4943]) -> [SKIP][258] ([Intel XE#4945]) +26 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#4915]) -> [SKIP][260] ([Intel XE#4208]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][261] ([Intel XE#5018]) -> [FAIL][262] ([Intel XE#4937])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][263] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [SKIP][264] ([Intel XE#4945])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [ABORT][265] ([Intel XE#5530]) -> [SKIP][266] ([Intel XE#4945])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][267] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][268] ([Intel XE#4945])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_media_fill@media-fill.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][269] ([Intel XE#2245]) -> [SKIP][270] ([Intel XE#4945])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_pat@pat-index-xelp.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][271] ([Intel XE#2284]) -> [SKIP][272] ([Intel XE#4945]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][273] ([Intel XE#4733]) -> [SKIP][274] ([Intel XE#4945]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][275] ([Intel XE#944]) -> [SKIP][276] ([Intel XE#4945]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][277] ([Intel XE#4273]) -> [SKIP][278] ([Intel XE#4945]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4056]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4056
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3481-91d0354204f2eb9c627499de521b4469330408b9 -> xe-pw-152142v3

  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3481-91d0354204f2eb9c627499de521b4469330408b9: 91d0354204f2eb9c627499de521b4469330408b9
  xe-pw-152142v3: 152142v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/index.html

--===============1759639388944981533==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fix VM crash during VF driver rel=
ease (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152142/">https://patchwork.freedesktop.org/series/152142/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152142v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152142v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3481-91d0354204f2eb9c627499de521b44693=
30408b9_FULL -&gt; xe-pw-152142v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152142v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152142v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1521=
42v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3=
/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues=
-new-bo-map.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152142v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4963">Intel XE#4963</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152142v3/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2142v3/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_b=
ig_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/s=
hard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-464/igt@k=
ms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-3/igt@kms_fli=
p@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-9/igt@=
kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-2/igt@kms_flip@=
flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@flip-=
vs-suspend-interruptible.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4056">Intel XE#4056</a>) +1 other test abort<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-3/igt@kms_flip=
@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_flip@plain-flip-f=
b-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_fli=
p_event_leak@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152142v3/shard-adlp-6/igt@kms_flip_event_leak@basic=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +7 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962=
">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_rpm@modeset=
-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4962">Intel XE#4962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +18 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@kms_scaling_modes@scaling-m=
ode-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-6/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152142v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@xe_exec_system_allocator@ma=
ny-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152142v3/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
142v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-strid=
e-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-435/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-433/igt@xe=
_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_device_create.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sha=
rd-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_device_cre=
ate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +47 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5679">Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-466/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152142v3/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_spin_=
batch@spin-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_spin_batch@spin-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
5">Intel XE#4945</a>) +570 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152142v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg=
2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-1/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-2/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sh=
ard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-464/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sh=
ard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-=
dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-8/igt@kms_pm_=
rpm@basic-rte.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-9/=
igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-2/igt@kms_pm_=
rpm@universal-planes-dpms.html">DMESG-WARN</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp-8/igt@kms_pm_rpm@u=
niversal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_drm_f=
dinfo@parallel-utilization-single-full-load-isolation.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE=
#5213</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152142v3/shard-bmg-4/igt@xe_drm_fdinfo@parallel-utilization-single-full-lo=
ad-isolation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-=
dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-4/igt@x=
e_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-adlp-3/igt@xe_pm@d=
3hot-mmap-system.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-adlp=
-3/igt@xe_pm@d3hot-mmap-system.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/s=
hard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#=
1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152142v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152142v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_cc=
s@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-d=
g2-464/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1521=
42v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-b=
mg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-435/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cdclk@mod=
e-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shar=
d-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">In=
tel XE#4950</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_ch=
amelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg=
2-464/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">=
Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152142v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg=
-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#495=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52142v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sh=
ard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152142v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v=
3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2142v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152142v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152142v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52142v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
142v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1521=
42v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142=
v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">In=
tel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152142v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-=
pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_joiner@ba=
sic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152142v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_backlight@fa=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5=
/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152142v3/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5=
/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +19 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-b=
mg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@kms_vrr@=
flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_vrr@flipline.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Int=
el XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_eudeb=
ug_online@interrupt-other.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_eu=
debug_online@interrupt-other.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_eudebug_=
sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v=
3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4945">Intel XE#4945</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1521=
42v3/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4945">Intel XE#4945</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-dg2-463/igt@xe_exe=
c_system_allocator@many-stride-mmap-remap-ro-dontunmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4=
915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52142v3/shard-dg2-464/igt@xe_exec_system_allocator@many-stride-mmap-remap-r=
o-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152142v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-1/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v=
3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-2/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-5/igt@xe_pxp@p=
xp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_=
pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/ig=
t@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3481-91d0354204f2eb9c627499de521b4469330408b9/shard-bmg-4/igt@xe_sriov=
_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152142v3/shard-bmg-5/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3481-91d0354204f2eb9c627499de521b4469330408b9 -&gt; xe-pw-152=
142v3</li>
</ul>
<p>IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3481-91d0354204f2eb9c627499de521b4469330408b9: 91d0354204f2eb9c627499d=
e521b4469330408b9<br />
  xe-pw-152142v3: 152142v3</p>

</body>
</html>

--===============1759639388944981533==--
