Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FB2E77173
	for <intel-xe@archiver.kernel.org>; Sat,  7 Dec 2024 01:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604AB10E2E2;
	Sat,  7 Dec 2024 01:36:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29310E1EA;
 Sat,  7 Dec 2024 01:36:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6874864860061980212=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/display=3A_Rework_d?=
 =?utf-8?q?isplay_init_for_reducing_flickering=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Dec 2024 01:36:56 -0000
Message-ID: <173353541655.3532147.8052657905252834287@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206185956.3290-1-dev@lankhorst.se>
In-Reply-To: <20241206185956.3290-1-dev@lankhorst.se>
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

--===============6874864860061980212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Rework display init for reducing flickering.
URL   : https://patchwork.freedesktop.org/series/142241/
State : failure

== Summary ==

CI Bug Log - changes from xe-2335-261a0301bda5af29477bd710465a8886e8609a4d_full -> xe-pw-142241v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142241v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142241v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142241v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][1] +2 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_evict@evict-beng-threads-small.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_evict@evict-beng-threads-small.html

  
Known issues
------------

  Here are the changes found in xe-pw-142241v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1125])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#664])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3279])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2370])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         NOTRUN -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +14 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3658])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][16] ([Intel XE#3468]) +28 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][18] ([Intel XE#1874]) +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#316]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#1231]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#2705]) +1 other test dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#3600])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][25] ([Intel XE#877])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1231] / [Intel XE#3052])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1874]) +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#367]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2314] / [Intel XE#2894])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1512]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#367])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +45 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +22 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +21 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#787]) +68 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#3433]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#3442])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][50] ([Intel XE#3673]) +7 other tests abort
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#3432]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3432]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2669]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#2907]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#314]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2724]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#314]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1152]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_cdclk@plane-scaling.html
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1152] / [Intel XE#455])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1152]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#306]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2325])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#306]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#373]) +14 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2252]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#373]) +17 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3278]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#307]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2390]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#307]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#455]) +48 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2320]) +10 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2321]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2321]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#308]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1424]) +15 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#3468]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [PASS][80] -> [DMESG-FAIL][81] ([Intel XE#3468]) +6 other tests dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#2577]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#309]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2291]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2291]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#309]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#323])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#323])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2286])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1508])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#3383])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2323])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2244]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_dsc@dsc-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2244])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][96] ([Intel XE#1695]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2372])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#701])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#701])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2373]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1138])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1138])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1138])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1135]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_feature_discovery@psr1.html
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2374])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1421]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#2316]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#310]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2316])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [PASS][112] -> [FAIL][113] ([Intel XE#2882]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip@blocking-wf_vblank.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][114] ([Intel XE#1504]) +1 other test timeout
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#886]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][117] -> [DMESG-WARN][118] ([Intel XE#3468]) +37 other tests dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][120] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1397]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2380]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][124] -> [DMESG-FAIL][125] ([Intel XE#324]) +3 other tests dmesg-fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1401]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2293]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#352])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#651]) +27 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#656]) +63 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2311]) +37 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [FAIL][133] ([Intel XE#1861]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][134] ([Intel XE#2333]) +4 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][135] ([Intel XE#3468]) +14 other tests dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#651]) +25 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1151])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2313]) +30 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#653]) +22 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2352])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1469])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1158])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2350])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2312]) +23 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#656]) +72 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#605])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#3374] / [Intel XE#3544])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1503])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1503]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#346])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#346])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#346])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#2925])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2934])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#356])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2501])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#356])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2486])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][159] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#3663])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][160] ([Intel XE#1727] / [Intel XE#3468])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][162] ([Intel XE#1035])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][163] ([Intel XE#2078]) +1 other test warn
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][164] -> [SKIP][165] ([Intel XE#2571])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#3307])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][167] -> [DMESG-WARN][168] ([Intel XE#2705] / [Intel XE#3468])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#2763]) +27 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#2763]) +8 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2763]) +19 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#870])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#870]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#736])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#3309])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2392])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#1129])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][179] ([Intel XE#2029])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#836])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#1439] / [Intel XE#3141])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#1489]) +16 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#1489]) +12 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#2893]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1128]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#1122]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2387]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#2850] / [Intel XE#929]) +18 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#1406]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2234])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#2939])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#2414])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#3414]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#3414]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#1127]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#1127])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#3414]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2413]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#1435])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1435])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#330])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#330])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2450])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][206] -> [DMESG-WARN][207] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-warn
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         NOTRUN -> [ABORT][208] ([Intel XE#1034] / [Intel XE#3673])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [ABORT][209] ([Intel XE#1034])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2168])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2168]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#1499])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1499])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#756])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#756]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#756])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][217] ([Intel XE#455] / [Intel XE#488])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#2905]) +10 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#2905]) +14 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][220] ([Intel XE#1473])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#688]) +23 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][222] ([Intel XE#2364])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][223] ([Intel XE#1473] / [Intel XE#2472])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#688]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#1392]) +12 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2322]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][228] ([Intel XE#1392]) +12 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][229] ([Intel XE#288]) +38 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#2360])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][231] ([Intel XE#358])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#2905]) +13 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][233] ([Intel XE#1727]) +2 other tests dmesg-warn
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][234] -> [DMESG-WARN][235] ([Intel XE#3467] / [Intel XE#3468])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][236] ([Intel XE#3467]) +1 other test dmesg-warn
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][237] ([Intel XE#3343])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][238] ([Intel XE#3467] / [Intel XE#3468])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][239] ([Intel XE#2229]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][240] -> [SKIP][241] ([Intel XE#1192])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2459] / [Intel XE#2596])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#560])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#512])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#586])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#512])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][247] ([Intel XE#1008])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_mmap@vram.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#3573]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#2838] / [Intel XE#979])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#1420])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#1420] / [Intel XE#2838])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#979])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pat@pat-index-xelpg.html
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#2236])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#979])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#2284])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#2284])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][257] ([Intel XE#1948])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#1948])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         NOTRUN -> [ABORT][260] ([Intel XE#1358] / [Intel XE#3673]) +1 other test abort
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][261] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#584]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pm@s3-mocs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][263] ([Intel XE#944]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][264] ([Intel XE#944]) +7 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#944]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@bind-execqueues-independent:
    - shard-bmg:          [PASS][266] -> [DMESG-WARN][267] ([Intel XE#1727]) +2 other tests dmesg-warn
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_vm@bind-execqueues-independent.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_vm@bind-execqueues-independent.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][268] ([Intel XE#3468]) -> [PASS][269] +17 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][270] -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][272] ([Intel XE#1874]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][274] ([Intel XE#2291]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][276] ([Intel XE#2425]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][278] ([Intel XE#3009]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_dp_aux_dev.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][280] ([Intel XE#2882]) -> [PASS][281] +1 other test pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][282] ([Intel XE#2316]) -> [PASS][283] +1 other test pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][284] ([Intel XE#3468]) -> [PASS][285] +51 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][286] ([Intel XE#886]) -> [PASS][287] +1 other test pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-FAIL][288] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][289] +2 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][290] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][291] +1 other test pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][292] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][294] ([Intel XE#1861]) -> [PASS][295] +1 other test pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-bmg:          [DMESG-WARN][296] ([Intel XE#2705]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [DMESG-WARN][298] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_plane_lowres@tiling-x.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [INCOMPLETE][300] ([Intel XE#3468]) -> [PASS][301] +1 other test pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][302] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][303] +1 other test pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [DMESG-WARN][304] ([Intel XE#3184]) -> [PASS][305] +1 other test pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [DMESG-WARN][306] -> [PASS][307] +5 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][308] ([Intel XE#1499]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [SKIP][334], [PASS][335]) ([Intel XE#378]) -> ([PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][361], [SKIP][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386]) ([Intel XE#2457]) -> ([PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [SKIP][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437]) ([Intel XE#378]) -> ([PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-4/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-4/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-4/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-9/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-9/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-4/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][463] ([Intel XE#3467]) -> [PASS][464] +4 other tests pass
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][465] ([Intel XE#958]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - shard-bmg:          [DMESG-WARN][467] ([Intel XE#1727]) -> [PASS][468]
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_prime_self_import@reimport-vs-gem_close-race.html

  * igt@xe_vm@large-split-binds-16777216:
    - shard-adlp:         [TIMEOUT][469] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][470] +2 other tests pass
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_vm@large-split-binds-16777216.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_vm@large-split-binds-16777216.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][471] ([Intel XE#2919]) -> [PASS][472]
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [DMESG-WARN][473] ([Intel XE#3468]) -> [SKIP][474] ([Intel XE#2291])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][475] ([Intel XE#2291]) -> [DMESG-WARN][476] ([Intel XE#877])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][477] ([Intel XE#2291]) -> [DMESG-WARN][478] ([Intel XE#3468])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [DMESG-FAIL][479] ([Intel XE#3468]) -> [FAIL][480] ([Intel XE#2141]) +2 other tests fail
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][481] ([Intel XE#2882]) -> [SKIP][482] ([Intel XE#2316])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][483] ([Intel XE#3468]) -> [FAIL][484] ([Intel XE#2882]) +1 other test fail
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][485] ([Intel XE#3468]) -> [FAIL][486] ([Intel XE#3321]) +1 other test fail
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][487] ([Intel XE#2316]) -> [DMESG-WARN][488] ([Intel XE#3468])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][489] ([Intel XE#2311]) -> [SKIP][490] ([Intel XE#2312]) +8 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][491] ([Intel XE#2312]) -> [SKIP][492] ([Intel XE#2311]) +4 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][493] ([Intel XE#3468]) -> [FAIL][494] ([Intel XE#2333]) +3 other tests fail
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][495] ([Intel XE#3468]) -> [SKIP][496] ([Intel XE#2312])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][497] ([Intel XE#2333]) -> [SKIP][498] ([Intel XE#2312]) +3 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][499] ([Intel XE#2312]) -> [DMESG-FAIL][500] ([Intel XE#3468])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][501] ([Intel XE#2312]) -> [FAIL][502] ([Intel XE#2333]) +5 other tests fail
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [FAIL][503] ([Intel XE#2333]) -> [DMESG-FAIL][504] ([Intel XE#3468]) +4 other tests dmesg-fail
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][505] ([Intel XE#2312]) -> [SKIP][506] ([Intel XE#2313]) +9 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][507] ([Intel XE#2313]) -> [SKIP][508] ([Intel XE#2312]) +13 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][509] ([Intel XE#1430]) -> [DMESG-FAIL][510] ([Intel XE#3468])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         [TIMEOUT][511] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][512] ([Intel XE#3414])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@kms_rotation_crc@bad-tiling.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][513] ([Intel XE#3673]) -> [ABORT][514] ([Intel XE#3468] / [Intel XE#3673]) +1 other test abort
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][515] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][516] ([Intel XE#1000])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr:
    - shard-bmg:          [DMESG-WARN][517] ([Intel XE#3468]) -> [DMESG-WARN][518] ([Intel XE#1727])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_exec_balancer@no-exec-parallel-userptr.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_exec_balancer@no-exec-parallel-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][519] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][520] ([Intel XE#3467]) +1 other test dmesg-warn
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][521] -> [DMESG-WARN][522] ([Intel XE#3468]) +1 other test dmesg-warn
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][523] ([Intel XE#3467]) -> [DMESG-WARN][524] ([Intel XE#3467] / [Intel XE#3468])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_pm@s2idle-basic:
    - shard-bmg:          [ABORT][525] ([Intel XE#3468] / [Intel XE#3673]) -> [ABORT][526] ([Intel XE#3673])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_pm@s2idle-basic.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [ABORT][527] ([Intel XE#1616]) -> [ABORT][528] ([Intel XE#1616] / [Intel XE#3468])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_pm@s2idle-multiple-execs.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][529] ([Intel XE#1130]) -> [ABORT][530] ([Intel XE#3421])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#3600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8141 -> IGT_8143
  * Linux: xe-2335-261a0301bda5af29477bd710465a8886e8609a4d -> xe-pw-142241v1

  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2335-261a0301bda5af29477bd710465a8886e8609a4d: 261a0301bda5af29477bd710465a8886e8609a4d
  xe-pw-142241v1: 142241v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/index.html

--===============6874864860061980212==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Rework display init for redu=
cing flickering.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142241/">https://patchwork.freedesktop.org/series/142241/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142241v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2335-261a0301bda5af29477bd710465a8886e=
8609a4d_full -&gt; xe-pw-142241v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142241v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142241v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1422=
41v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@p=
ipe-d-hdmi-a-1.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-modifiers.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_evict=
@evict-beng-threads-small.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_evict@evict-beng=
-threads-small.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142241v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_atomic@plane-primary-over=
lay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_atomic_transition@plane-=
toggle-modeset-transition.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +28 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/ig=
t@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/sha=
rd-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-f=
lip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3600">Intel XE#3600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adl=
p-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231=
">Intel XE#1231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE=
#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +45 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +68 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +7 other tests ab=
ort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
152">Intel XE#1152</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1152">Intel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1152">Intel XE#1152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_content_protection@atomic=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_crc@cursor-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_cursor_=
crc@cursor-suspend@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other =
tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-=
left-edge.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3383">Intel XE#3383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_display_modes@mst-extende=
d-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1695">Intel XE#1695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142241v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 o=
ther tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +63 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +37 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
tiling-linear.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +14 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +23 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +72 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-re=
ad-crc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-re=
ad-crc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-re=
ad-crc@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 =
other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_plane@pixel-format-sourc=
e-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/=
shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-form=
at@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +27 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +16 other tests skip<=
/li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_vbla=
nk@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@k=
ms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_vblank@ts-continuation-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1034">Intel XE#1034</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@kms_vblank@ts-continuation-s=
uspend@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@kms_writeback@writeback-pixe=
l-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_ccs@block-copy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_evict@evict-large-multi-vm=
-cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_evict@evict-mixed-threads-=
large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_exec_fault_mode@many-exec=
queues-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_exec_threads@threads-bal-s=
hared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/sha=
rd-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fa=
il-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_live_ktest@xe_bo@xe_bo_ev=
ict_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3673">Intel XE#3673</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_vm@bi=
nd-execqueues-independent.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_vm@bind-execqueu=
es-independent.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn=
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/ig=
t@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
41v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hfl=
ip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@kms_big=
_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@kms_=
big_fb@y-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2=
291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cu=
rsor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142241v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
41v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible@a-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142241v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/ig=
t@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-vali=
d-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#=
1861</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_pipe=
_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1=
/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_plan=
e_lowres@tiling-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg=
-4/igt@kms_plane_lowres@tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142241v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-=
with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Inte=
l XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-=
unity-scaling-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@kms_pm_r=
pm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@kms=
_pm_rpm@legacy-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_prop=
erties@connector-properties-legacy.html">DMESG-WARN</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_=
properties@connector-properties-legacy.html">PASS</a> +5 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e860=
9a4d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886=
e8609a4d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a=
8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710=
465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477b=
d710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29=
477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5=
af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301=
bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a=
0301bda5af29477bd710465a8886e8609a4d/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-=
261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sh=
ard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4=
d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
241v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
241v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
241v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
241v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142241v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
241v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e860=
9a4d/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886=
e8609a4d/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a=
8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710=
465a8886e8609a4d/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477b=
d710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29=
477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5=
af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301=
bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a=
0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-=
261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4=
d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142241v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4=
d/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8=
609a4d/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8=
886e8609a4d/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710=
465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477=
bd710465a8886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af=
29477bd710465a8886e8609a4d/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301b=
da5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a=
0301bda5af29477bd710465a8886e8609a4d/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335=
-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8609a4=
d/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8886e8=
609a4d/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710465a8=
886e8609a4d/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477bd710=
465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af29477=
bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2335-261a0301bda5af=
29477bd710465a8886e8609a4d/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
41v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142241v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-a=
dlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142241v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/sh=
ard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142241v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241=
v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142241v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142241v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shar=
d-adlp-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@xe_modul=
e_load@reload-no-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-7/ig=
t@xe_module_load@reload-no-display.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-lnl-4/igt@xe_pm_re=
sidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-lnl-5/igt@xe_pm_reside=
ncy@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_prime=
_self_import@reimport-vs-gem_close-race.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/s=
hard-bmg-1/igt@xe_prime_self_import@reimport-vs-gem_close-race.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@xe_vm@l=
arge-split-binds-16777216.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shar=
d-adlp-1/igt@xe_vm@large-split-binds-16777216.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-5/igt@xe_wedged@=
basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-=
bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#229=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-3/igt@kms=
_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +2 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-=
bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1=
/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882=
">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1=
/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321=
">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_flip@2x-fl=
ip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
41v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1422=
41v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v=
1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-=
1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42241v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-5/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-adlp-8/igt@kms_rot=
ation_crc@bad-tiling.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-adl=
p-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#=
3673</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142241v1/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-s=
ystem-vram01.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_evict=
@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg=
-4/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_exec_=
balancer@no-exec-parallel-userptr.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-b=
mg-8/igt@xe_exec_balancer@no-exec-parallel-userptr.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">I=
ntel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1=
 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/sh=
ard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-7/igt@xe_fault=
_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#=
3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142241v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_=
execute.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-8/igt@xe_pm@s2=
idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pm=
@s2idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-3/igt@xe_pm@s2=
idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-1/igt@xe_pm@s2id=
le-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2335-261a0301bda5af29477bd710465a8886e8609a4d/shard-bmg-4/igt@xe_wedge=
d@wedged-at-any-timeout.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142241v1/shard-bmg-4/igt@xe_wedg=
ed@wedged-at-any-timeout.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8141 -&gt; IGT_8143</li>
<li>Linux: xe-2335-261a0301bda5af29477bd710465a8886e8609a4d -&gt; xe-pw-142=
241v1</li>
</ul>
<p>IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2335-261a0301bda5af29477bd710465a8886e8609a4d: 261a0301bda5af29477bd71=
0465a8886e8609a4d<br />
  xe-pw-142241v1: 142241v1</p>

</body>
</html>

--===============6874864860061980212==--
