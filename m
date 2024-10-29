Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F96D2AB1F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 11:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999B989B48;
	Tue, 29 Oct 2024 11:34:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493489B48;
 Tue, 29 Oct 2024 11:34:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0032888622542704096=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/mmap=3A_Add_mmap_support?=
 =?utf-8?q?_for_PCI_memory_barrier_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 11:34:18 -0000
Message-ID: <173020165839.1358441.6077842403577191679@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
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

--===============0032888622542704096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev6)
URL   : https://patchwork.freedesktop.org/series/139769/
State : failure

== Summary ==

CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_full -> xe-pw-139769v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139769v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139769v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139769v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_psr@psr2-basic:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_psr@psr2-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-7/igt@kms_psr@psr2-basic.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html

  * igt@xe_oa@mi-rpc:
    - shard-lnl:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_oa@mi-rpc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@mi-rpc@rcs-0:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_oa@mi-rpc@rcs-0.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][12] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-139769v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1885])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#1885])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1125])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#827])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3194]) +3 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#3007]) +20 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_async_flips@crc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2423] / [i915#2575])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2370])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][27] -> [FAIL][28] ([Intel XE#1426]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2231]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#316]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1874]) +2 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#3007]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#367]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#787]) +34 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#3113])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#1727])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#3113]) +1 other test dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1195]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2724])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#306])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#306])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#373]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2390])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#1178]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2320]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#308])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2321])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#877])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#1475])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1475])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#301]) +3 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#301]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#886]) +6 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][80] -> [FAIL][81] ([Intel XE#301])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [PASS][86] -> [DMESG-FAIL][87] ([Intel XE#3194]) +1 other test dmesg-fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2311]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1861]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2231]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2890]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2890])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#656]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#651]) +13 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#651]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2313]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +4 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2351] / [Intel XE#2890])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#653]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2925])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][104] ([Intel XE#2566] / [Intel XE#3177])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][105] ([Intel XE#3177]) +11 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1122])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1129])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#1430])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#2446])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2446])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3184])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#836])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1489])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1489]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1122])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#2423] / [i915#2575]) +21 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2329])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#1729])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#2443]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@kms_vrr@flip-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2168])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1499])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#756])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         [PASS][131] -> [FAIL][132] ([Intel XE#2667])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#2667])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2905]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2905]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2905]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#261] / [Intel XE#688])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][139] -> [INCOMPLETE][140] ([Intel XE#1473])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [PASS][141] -> [INCOMPLETE][142] ([Intel XE#1195] / [Intel XE#1473])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#688])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1130]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-parallel-userptr.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-bmg:          [PASS][145] -> [SKIP][146] ([Intel XE#1130]) +33 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2322]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-lnl:          [PASS][148] -> [DMESG-WARN][149] ([Intel XE#3230]) +3 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([Intel XE#1130]) +26 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#288]) +9 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#288]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-cm-basic:
    - shard-adlp:         [PASS][154] -> [DMESG-WARN][155] ([Intel XE#3230]) +1 other test dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_exec_threads@threads-cm-basic.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@xe_exec_threads@threads-cm-basic.html
    - shard-dg2-set2:     [PASS][156] -> [DMESG-WARN][157] ([Intel XE#3230])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_exec_threads@threads-cm-basic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@xe_exec_threads@threads-cm-basic.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [PASS][158] -> [DMESG-WARN][159] ([Intel XE#358]) +1 other test dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-rebind.html
    - shard-bmg:          [PASS][160] -> [DMESG-WARN][161] ([Intel XE#3230]) +5 other tests dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_exec_threads@threads-hang-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@xe_exec_threads@threads-hang-rebind.html
    - shard-dg2-set2:     [PASS][162] -> [DMESG-WARN][163] ([Intel XE#358]) +1 other test dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - shard-lnl:          [PASS][164] -> [DMESG-WARN][165] ([Intel XE#877])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-rebind.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_exec_threads@threads-mixed-fd-rebind.html

  * igt@xe_exec_threads@threads-mixed-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][166] ([Intel XE#3230])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_exec_threads@threads-mixed-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2229])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2229])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#2229])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][170] ([Intel XE#1999]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][171] ([Intel XE#1999]) +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#378])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][173] -> [FAIL][174] ([Intel XE#2249]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [PASS][175] -> [FAIL][176] ([Intel XE#2249])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][177] ([Intel XE#2249])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-bmg:          [PASS][178] -> [FAIL][179] ([Intel XE#2514]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [PASS][180] -> [FAIL][181] ([Intel XE#2514]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@polling:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#2541])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_oa@polling.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#2541]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#1420])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#979])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1130]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [PASS][187] -> [DMESG-WARN][188] ([Intel XE#2932])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_pm@s2idle-mocs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2284]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][190] -> [ABORT][191] ([Intel XE#1358] / [Intel XE#1607])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][192] -> [ABORT][193] ([Intel XE#1607] / [Intel XE#1794])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][194] ([Intel XE#1885]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1885]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@core_hotunplug@hotunbind-rebind.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_addfb_basic@unused-offsets:
    - shard-bmg:          [SKIP][198] ([Intel XE#3007]) -> [PASS][199] +10 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_addfb_basic@unused-offsets.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - shard-bmg:          [FAIL][200] ([Intel XE#827]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][202] ([Intel XE#1701]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][204] ([Intel XE#1426]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][206] ([Intel XE#2231]) -> [PASS][207] +2 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][208] ([Intel XE#877]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [SKIP][210] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][211] +3 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][212] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][214] ([Intel XE#3194]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][216] ([Intel XE#1195]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [FAIL][218] ([Intel XE#1475]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][220] ([Intel XE#1541]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][222] ([Intel XE#2958]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#301]) -> [PASS][225] +7 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2423] / [i915#2575]) -> [PASS][227] +11 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][228] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][230] ([Intel XE#886]) -> [PASS][231] +3 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][232] ([Intel XE#301]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-adlp:         [DMESG-WARN][234] -> [PASS][235] +4 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][236] ([Intel XE#1874]) -> [PASS][237] +3 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2890]) -> [PASS][239] +8 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][240] ([Intel XE#718]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][242] ([Intel XE#2446]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2446]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][246] ([Intel XE#2042]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-lnl:          [DMESG-WARN][248] ([Intel XE#2932]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-68.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][250] ([Intel XE#2883]) -> [PASS][251] +6 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_setmode@basic.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_setmode@basic.html

  * igt@xe_drm_fdinfo@utilization-all-full-load:
    - shard-lnl:          [FAIL][252] -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_drm_fdinfo@utilization-all-full-load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_drm_fdinfo@utilization-all-full-load.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [INCOMPLETE][254] ([Intel XE#1473]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          [DMESG-WARN][256] ([Intel XE#3230]) -> [PASS][257] +5 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_fault_mode@invalid-va.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [DMESG-WARN][258] ([Intel XE#3230]) -> [PASS][259] +5 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-fault.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-dg2-set2:     [DMESG-WARN][260] ([Intel XE#3230]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [DMESG-WARN][262] ([Intel XE#3230]) -> [PASS][263] +3 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][264] ([Intel XE#358]) -> [PASS][265] +2 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-shared-vm-basic:
    - shard-adlp:         [DMESG-WARN][266] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#358]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][268] ([Intel XE#3184]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1192]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [SKIP][272] ([Intel XE#1192]) -> [PASS][273] +1 other test pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
    - shard-adlp:         [SKIP][274] ([Intel XE#1192]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_live_ktest@xe_migrate.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][276] ([Intel XE#2136]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@xe_module_load@many-reload.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     [FAIL][278] ([Intel XE#2136]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@xe_module_load@many-reload.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_module_load@many-reload.html
    - shard-lnl:          [DMESG-WARN][280] ([Intel XE#2910]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_module_load@many-reload.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_module_load@many-reload.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-bmg:          [INCOMPLETE][282] ([Intel XE#2655]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:
    - shard-bmg:          [INCOMPLETE][284] -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][286] ([Intel XE#958]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [FAIL][288] ([Intel XE#1081]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_vm@large-binds-2097152:
    - shard-adlp:         [DMESG-WARN][290] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][291] +2 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_vm@large-binds-2097152.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@xe_vm@large-binds-2097152.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1130]) -> [PASS][293] +19 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@large-userptr-binds-2147483648:
    - shard-adlp:         [TIMEOUT][294] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][295] +4 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_vm@large-userptr-binds-2147483648.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_vm@large-userptr-binds-2147483648.html

  * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
    - shard-bmg:          [SKIP][296] ([Intel XE#1130]) -> [PASS][297] +24 other tests pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][298] ([Intel XE#3007]) -> [SKIP][299] ([Intel XE#2385])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][300] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][301] ([Intel XE#1874])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][302] ([Intel XE#3194]) -> [FAIL][303] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][304] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052]) -> [FAIL][305] ([Intel XE#1242] / [Intel XE#3052])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][306] ([Intel XE#1124]) -> [SKIP][307] ([Intel XE#2231])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1124]) -> [SKIP][309] ([Intel XE#2890]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-bmg:          [SKIP][310] ([Intel XE#1124]) -> [SKIP][311] ([Intel XE#2231] / [Intel XE#2890])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][312] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][313] ([Intel XE#3007])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2191]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#367]) -> [SKIP][317] ([Intel XE#2423] / [i915#2575])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [SKIP][319] ([Intel XE#367]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          [SKIP][320] ([Intel XE#3007]) -> [SKIP][321] ([Intel XE#367])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][322] ([Intel XE#2231]) -> [SKIP][323] ([Intel XE#2887])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2890]) -> [SKIP][325] ([Intel XE#455] / [Intel XE#787])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          [SKIP][326] ([Intel XE#2887]) -> [SKIP][327] ([Intel XE#2231] / [Intel XE#2890])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][329] ([Intel XE#2351] / [Intel XE#2890])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][330] ([Intel XE#1195]) -> [INCOMPLETE][331] ([Intel XE#1195] / [Intel XE#1727])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][332] ([Intel XE#2325]) -> [SKIP][333] ([Intel XE#3007])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#306]) -> [SKIP][335] ([Intel XE#2423] / [i915#2575])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2423] / [i915#2575]) -> [SKIP][337] ([Intel XE#306])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_chamelium_color@gamma.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          [SKIP][338] ([Intel XE#3007]) -> [SKIP][339] ([Intel XE#2325])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_chamelium_color@gamma.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          [SKIP][340] ([Intel XE#2252]) -> [SKIP][341] ([Intel XE#3007])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#373]) -> [SKIP][343] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][344] ([Intel XE#1178]) -> [SKIP][345] ([Intel XE#2423] / [i915#2575])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [DMESG-FAIL][346] ([Intel XE#3177]) -> [SKIP][347] ([Intel XE#3007])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][348] ([Intel XE#3007]) -> [SKIP][349] ([Intel XE#2320]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][350] ([Intel XE#2320]) -> [SKIP][351] ([Intel XE#3007])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][352] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][353] ([Intel XE#2244])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_dsc@dsc-basic.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][354] ([Intel XE#776]) -> [SKIP][355] ([Intel XE#2231] / [Intel XE#2890])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#776]) -> [SKIP][357] ([Intel XE#2890])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][358] ([Intel XE#1195]) -> [FAIL][359] ([Intel XE#301]) +1 other test fail
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][360] ([Intel XE#1504]) -> [TIMEOUT][361] ([Intel XE#1504]) +1 other test timeout
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][362] ([Intel XE#2597]) -> [SKIP][363] ([Intel XE#3007])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][364] ([Intel XE#2231]) -> [SKIP][365] ([Intel XE#2293] / [Intel XE#2380])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2890]) -> [SKIP][367] ([Intel XE#455])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2890]) -> [SKIP][369] ([Intel XE#651]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
    - shard-bmg:          [SKIP][370] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][371] ([Intel XE#2311])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][372] ([Intel XE#2311]) -> [SKIP][373] ([Intel XE#2231] / [Intel XE#2890]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][374] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][375] ([Intel XE#2333]) +1 other test fail
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][376] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][377] ([Intel XE#1861])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [TIMEOUT][378] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][379] ([Intel XE#1861])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-bmg:          [SKIP][380] ([Intel XE#2231]) -> [FAIL][381] ([Intel XE#2333])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [FAIL][382] ([Intel XE#2333]) -> [SKIP][383] ([Intel XE#2231]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#651]) -> [SKIP][385] ([Intel XE#2890]) +5 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
    - shard-bmg:          [SKIP][386] ([Intel XE#2311]) -> [SKIP][387] ([Intel XE#2231])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][389] ([Intel XE#651]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][390] ([Intel XE#2231]) -> [SKIP][391] ([Intel XE#2311]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#653]) -> [SKIP][393] ([Intel XE#2890]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][394] ([Intel XE#2231]) -> [SKIP][395] ([Intel XE#2313]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][397] ([Intel XE#653]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][398] ([Intel XE#2313]) -> [SKIP][399] ([Intel XE#2231]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][400] ([Intel XE#2313]) -> [SKIP][401] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#653]) -> [SKIP][403] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2890]) -> [SKIP][405] ([Intel XE#653]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-adlp:         [TIMEOUT][406] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][407] ([Intel XE#653])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
    - shard-bmg:          [SKIP][408] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][409] ([Intel XE#2313]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][410] ([Intel XE#3007]) -> [SKIP][411] ([Intel XE#2502])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#2423] / [i915#2575]) -> [SKIP][413] ([Intel XE#605])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][414] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][415] ([Intel XE#1035])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_plane@pixel-format.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [DMESG-WARN][416] ([Intel XE#3177]) -> [SKIP][417] ([Intel XE#3007])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [SKIP][418] ([Intel XE#3007]) -> [DMESG-WARN][419] ([Intel XE#2566] / [Intel XE#3177]) +1 other test dmesg-warn
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][420] ([Intel XE#2231]) -> [SKIP][421] ([Intel XE#1489])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2890]) -> [SKIP][423] ([Intel XE#1489])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][424] ([Intel XE#1489]) -> [SKIP][425] ([Intel XE#2231]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#1489]) -> [SKIP][427] ([Intel XE#2890]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][428] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][429] ([Intel XE#2387])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2890]) -> [SKIP][431] ([Intel XE#1122])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          [SKIP][432] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][433] ([Intel XE#2234] / [Intel XE#2850])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr@fbc-pr-primary-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][435] ([Intel XE#2850] / [Intel XE#929])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr@fbc-pr-primary-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][437] ([Intel XE#2890]) +2 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          [SKIP][438] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][439] ([Intel XE#2231] / [Intel XE#2890])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_psr@pr-no-drrs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][440] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][441] ([Intel XE#2231]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_psr@psr2-suspend.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         [INCOMPLETE][442] ([Intel XE#1033] / [Intel XE#1195]) -> [FAIL][443] ([Intel XE#1874])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2423] / [i915#2575]) -> [SKIP][445] ([Intel XE#455]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-bmg:          [SKIP][446] ([Intel XE#3007]) -> [SKIP][447] ([Intel XE#2413])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#455]) -> [SKIP][449] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html
    - shard-bmg:          [SKIP][450] ([Intel XE#1499]) -> [SKIP][451] ([Intel XE#3007])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][452] ([Intel XE#3007]) -> [SKIP][453] ([Intel XE#2168])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_vrr@lobf.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2423] / [i915#2575]) -> [SKIP][455] ([Intel XE#2168])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_vrr@lobf.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2423] / [i915#2575]) -> [SKIP][457] ([Intel XE#756])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][458] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][459] ([Intel XE#3007])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][461] ([Intel XE#2423] / [i915#2575])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          [SKIP][462] ([Intel XE#2905]) -> [SKIP][463] ([Intel XE#1130]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_eudebug@read-metadata.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_eudebug@read-metadata.html
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#2905]) -> [SKIP][465] ([Intel XE#1130]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_eudebug@read-metadata.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][466] ([Intel XE#1130]) -> [SKIP][467] ([Intel XE#2905]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_eudebug_online@stopped-thread.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1130]) -> [SKIP][469] ([Intel XE#2905]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_eudebug_online@stopped-thread.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][470] ([Intel XE#1473]) -> [FAIL][471] ([Intel XE#1000])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][472] ([Intel XE#2322]) -> [SKIP][473] ([Intel XE#1130]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#288]) -> [SKIP][475] ([Intel XE#1130]) +4 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_exec_fault_mode@many-basic.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1130]) -> [SKIP][477] ([Intel XE#288]) +2 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#1130]) -> [DMESG-WARN][479] ([Intel XE#3230])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
    - shard-bmg:          [SKIP][480] ([Intel XE#1130]) -> [DMESG-WARN][481] ([Intel XE#3230])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html
    - shard-adlp:         [TIMEOUT][482] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][483] ([Intel XE#3230])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-adlp:         [SKIP][484] ([Intel XE#1192]) -> [FAIL][485] ([Intel XE#1999])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_live_ktest@xe_mocs.html
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#1192]) -> [FAIL][487] ([Intel XE#1999])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#2541]) -> [SKIP][489] ([Intel XE#1130])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@polling:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#1130]) -> [SKIP][491] ([Intel XE#2541])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_oa@polling.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@polling.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#1130]) -> [SKIP][493] ([Intel XE#579])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][494] ([Intel XE#1130]) -> [SKIP][495] ([Intel XE#579])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [FAIL][496] ([Intel XE#2922]) -> [SKIP][497] ([Intel XE#1130])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@xe_tlb@basic-tlb.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_tlb@basic-tlb.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2655]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8083 -> IGT_8084
  * Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -> xe-pw-139769v6

  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8084: 4ebef261c74f8efbd7d1921e8b91e178a9e897fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea
  xe-pw-139769v6: 139769v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/index.html

--===============0032888622542704096==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmap: Add mmap support for PCI memory barrier (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139769/">https://patchwork.freedesktop.org/series/139769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_full -&gt; xe-pw-139769v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139769v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139769v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139769v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_psr@psr2-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-7/igt@kms_psr@psr2-basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_oa@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_oa@mi-rpc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_oa@mi-rpc@rcs-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139769v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_evict@evict-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_exec_threads@threads-cm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@xe_exec_threads@threads-cm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_exec_threads@threads-cm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@xe_exec_threads@threads-cm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +5 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_exec_threads@threads-mixed-fd-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_exec_threads@threads-mixed-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_pm@s2idle-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_addfb_basic@unused-offsets.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-68.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_setmode@basic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-all-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_drm_fdinfo@utilization-all-full-load.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-4/igt@xe_drm_fdinfo@utilization-all-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_module_load@many-reload.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910">Intel XE#2910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-1/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655">Intel XE#2655</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2097152:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_vm@large-binds-2097152.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-1/igt@xe_vm@large-binds-2097152.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_vm@large-userptr-binds-2147483648.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_vm@large-userptr-binds-2147483648.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-463/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-adlp-8/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-436/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v6/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8083 -&gt; IGT_8084</li>
<li>Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -&gt; xe-pw-139769v6</li>
</ul>
<p>IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8084: 4ebef261c74f8efbd7d1921e8b91e178a9e897fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea<br />
  xe-pw-139769v6: 139769v6</p>

</body>
</html>

--===============0032888622542704096==--
