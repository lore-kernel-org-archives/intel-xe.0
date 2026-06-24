Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D54CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 16:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980E10E0A7;
	Wed, 24 Jun 2026 16:47:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B3C10E0A7;
 Wed, 24 Jun 2026 16:47:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1514427374349739005=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Couple_fdinfo_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 16:47:56 -0000
Message-ID: <178231967671.112694.4075350451090544421@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624113837.342961-4-matthew.auld@intel.com>
In-Reply-To: <20260624113837.342961-4-matthew.auld@intel.com>
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

--===============1514427374349739005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Couple fdinfo improvements
URL   : https://patchwork.freedesktop.org/series/169094/
State : failure

== Summary ==

CI Bug Log - changes from xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82_FULL -> xe-pw-169094v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169094v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169094v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169094v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +3346 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [SKIP][3] +178 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_system_allocator@twice-new-prefetch:
    - shard-lnl:          [PASS][4] -> [SKIP][5] +3353 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_exec_system_allocator@twice-new-prefetch.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_exec_system_allocator@twice-new-prefetch.html

  * igt@xe_pat@pat-index-auto:
    - shard-lnl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_pat@pat-index-auto.html

  
#### Warnings ####

  * igt@asahi/asahi_get_params@get-params:
    - shard-lnl:          [SKIP][7] ([Intel XE#8416]) -> [SKIP][8] +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@asahi/asahi_get_params@get-params.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@asahi/asahi_get_params@get-params.html

  * igt@asahi/asahi_get_time@get-time-flags-uint64-max:
    - shard-bmg:          [SKIP][9] ([Intel XE#8416]) -> [SKIP][10] +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@asahi/asahi_get_time@get-time-flags-uint64-max.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@asahi/asahi_get_time@get-time-flags-uint64-max.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          [SKIP][11] ([Intel XE#1125] / [Intel XE#7312]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          [SKIP][13] ([Intel XE#1466]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          [SKIP][15] ([Intel XE#3157]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][17] ([Intel XE#3279]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][19] ([Intel XE#2370]) -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][21] ([Intel XE#2327]) -> [SKIP][22] +18 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][23] ([Intel XE#3658] / [Intel XE#7360]) -> [SKIP][24] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][25] ([Intel XE#1407]) -> [SKIP][26] +22 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][27] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][29] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][30] +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][31] ([Intel XE#1124]) -> [SKIP][32] +56 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][33] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          [SKIP][35] ([Intel XE#1467] / [Intel XE#7367]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][37] ([Intel XE#1477] / [Intel XE#7361]) -> [SKIP][38] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][39] ([Intel XE#1428] / [Intel XE#7387]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][41] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][43] ([Intel XE#1124]) -> [SKIP][44] +54 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][45] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][47] ([Intel XE#7679]) -> [SKIP][48] +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][49] ([Intel XE#7679]) -> [SKIP][50] +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][51] ([Intel XE#8365]) -> [SKIP][52] +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][53] ([Intel XE#367]) -> [SKIP][54] +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][55] ([Intel XE#367]) -> [SKIP][56] +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][57] ([Intel XE#2887]) -> [SKIP][58] +76 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][59] ([Intel XE#2669] / [Intel XE#3433] / [Intel XE#7389]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][61] ([Intel XE#3432]) -> [SKIP][62] +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][63] ([Intel XE#2652]) -> [SKIP][64] +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][65] ([Intel XE#3432]) -> [SKIP][66] +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][67] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][68] +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][69] ([Intel XE#2887]) -> [SKIP][70] +71 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][71] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][72] +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          [SKIP][73] ([Intel XE#7008]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][75] ([Intel XE#4416] / [Intel XE#7381]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cdclk@plane-scaling.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][77] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][78] +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][79] ([Intel XE#306] / [Intel XE#7358]) -> [SKIP][80] +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-lnl:          [SKIP][81] ([Intel XE#7358]) -> [SKIP][82] +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][83] ([Intel XE#7358]) -> [SKIP][84] +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][85] ([Intel XE#2252]) -> [SKIP][86] +37 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][87] ([Intel XE#373]) -> [SKIP][88] +41 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][89] ([Intel XE#6507]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          [SKIP][91] ([Intel XE#6507]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][93] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only.html
    - shard-bmg:          [SKIP][95] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][97] ([Intel XE#7642]) -> [SKIP][98] +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][99] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][100] +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][101] ([Intel XE#6974]) -> [SKIP][102] +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][103] ([Intel XE#6974]) -> [SKIP][104] +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][105] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][106] +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][107] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][108] +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_content_protection@legacy.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][109] ([Intel XE#1468] / [Intel XE#7396]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_content_protection@mei-interface.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][111] ([Intel XE#7642]) -> [SKIP][112] +10 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_content_protection@suspend-resume.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][113] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][114] +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][115] ([Intel XE#2320]) -> [SKIP][116] +25 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          [SKIP][117] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][118] +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          [SKIP][119] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][120] +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][121] ([Intel XE#1424]) -> [SKIP][122] +26 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          [SKIP][123] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][124] +22 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][125] ([Intel XE#7809]) -> [SKIP][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][127] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][128] +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          [SKIP][129] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][130] +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][131] ([Intel XE#1508]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-bmg:          [SKIP][133] ([Intel XE#1508]) -> [SKIP][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][135] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][137] ([Intel XE#4302]) -> [SKIP][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][139] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          [SKIP][141] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][143] ([Intel XE#4354] / [Intel XE#7450]) -> [SKIP][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][145] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          [SKIP][147] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][149] ([Intel XE#4294] / [Intel XE#7477]) -> [SKIP][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][151] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-bmg:          [SKIP][153] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          [SKIP][155] ([Intel XE#8265]) -> [SKIP][156] +18 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_dsc@dsc-basic-bigjoiner.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          [SKIP][157] ([Intel XE#8265]) -> [SKIP][158] +20 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][159] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][160] +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][161] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][162] +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][163] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][164] +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][165] ([Intel XE#6126] / [Intel XE#776]) -> [SKIP][166] +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][167] ([Intel XE#702] / [Intel XE#7344]) -> [SKIP][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_feature_discovery@display-2x.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][169] ([Intel XE#703] / [Intel XE#7448]) -> [SKIP][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_feature_discovery@display-3x.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          [SKIP][171] ([Intel XE#2373] / [Intel XE#7448]) -> [SKIP][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          [SKIP][173] ([Intel XE#1138] / [Intel XE#7344]) -> [SKIP][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][175] ([Intel XE#1138] / [Intel XE#7344]) -> [SKIP][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          [SKIP][177] ([Intel XE#1137] / [Intel XE#2375]) -> [SKIP][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          [SKIP][179] ([Intel XE#2375]) -> [SKIP][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_feature_discovery@dp-mst.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][181] ([Intel XE#2374] / [Intel XE#6127]) -> [SKIP][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_feature_discovery@psr1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][183] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][185] ([Intel XE#1421]) -> [SKIP][186] +41 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [FAIL][187] ([Intel XE#6266]) -> [SKIP][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][189] ([Intel XE#301]) -> [SKIP][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          [SKIP][191] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][192] +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          [SKIP][193] ([Intel XE#7179]) -> [SKIP][194] +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][195] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][196] +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][197] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) -> [SKIP][198] +7 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][199] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][200] +20 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][201] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][202] +19 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][203] ([Intel XE#7179]) -> [SKIP][204] +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          [SKIP][205] ([Intel XE#352]) -> [SKIP][206] +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][207] ([Intel XE#7905]) -> [SKIP][208] +253 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][209] ([Intel XE#7061]) -> [SKIP][210] +31 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][211] ([Intel XE#4141]) -> [SKIP][212] +72 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][213] ([Intel XE#6312]) -> [SKIP][214] +89 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#2311]) -> [SKIP][216] +297 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][217] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][218] +25 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][219] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][220] +23 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][221] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][222] +65 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][223] ([Intel XE#1469] / [Intel XE#7399]) -> [SKIP][224] +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][225] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][226] +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][227] ([Intel XE#7399]) -> [SKIP][228] +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][229] ([Intel XE#7399]) -> [SKIP][230] +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][231] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][233] ([Intel XE#2313]) -> [SKIP][234] +294 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][235] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][236] +213 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [SKIP][237] ([Intel XE#7865]) -> [SKIP][238] +149 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#7061]) -> [SKIP][240] +30 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          [SKIP][241] ([Intel XE#1470]) -> [SKIP][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          [SKIP][243] ([Intel XE#1470] / [Intel XE#2853]) -> [SKIP][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [SKIP][245] ([Intel XE#7308]) -> [SKIP][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][247] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [SKIP][249] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][251] ([Intel XE#1503]) -> [SKIP][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][253] ([Intel XE#1503]) -> [SKIP][254] +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          [SKIP][255] ([Intel XE#6901]) -> [SKIP][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          [SKIP][257] ([Intel XE#6901]) -> [SKIP][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          [SKIP][259] ([Intel XE#7086] / [Intel XE#7390]) -> [SKIP][260] +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_joiner@basic-force-big-joiner.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          [SKIP][261] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_joiner@basic-max-non-joiner.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          [SKIP][263] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          [SKIP][265] ([Intel XE#6900] / [Intel XE#7362]) -> [SKIP][266] +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          [SKIP][267] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][268] +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][269] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][270] +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][271] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          [SKIP][273] ([Intel XE#7173] / [Intel XE#7294]) -> [SKIP][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          [SKIP][275] ([Intel XE#8348]) -> [SKIP][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_mst@mst-suspend-read-crc.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_mst@mst-suspend-read-crc.html
    - shard-bmg:          [SKIP][277] ([Intel XE#8348]) -> [SKIP][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_mst@mst-suspend-read-crc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][279] ([Intel XE#7591]) -> [SKIP][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          [SKIP][281] ([Intel XE#7591]) -> [SKIP][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][283] ([Intel XE#2486]) -> [SKIP][284] +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][285] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][287] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          [SKIP][289] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          [SKIP][291] ([Intel XE#7283]) -> [SKIP][292] +23 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][293] ([Intel XE#7283]) -> [SKIP][294] +23 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][295] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][296] +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][297] ([Intel XE#599]) -> [SKIP][298] +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          [SKIP][299] ([Intel XE#2393]) -> [SKIP][300] +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][301] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][302] +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][303] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][304] +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][305] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][306] +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
    - shard-bmg:          [SKIP][307] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][308] +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][309] ([Intel XE#2685] / [Intel XE#3307]) -> [SKIP][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          [SKIP][311] ([Intel XE#3307]) -> [SKIP][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][313] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][314] +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][315] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][316] +9 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][317] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][318] +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][319] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][321] ([Intel XE#8395]) -> [SKIP][322] +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-lnl:          [SKIP][323] ([Intel XE#8395]) -> [SKIP][324] +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-framegap.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][325] ([Intel XE#1131]) -> [SKIP][326]
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][327] ([Intel XE#6927]) -> [SKIP][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          [SKIP][329] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][330]
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][331] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][333] ([Intel XE#7794]) -> [SKIP][334]
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][335] ([Intel XE#2029] / [Intel XE#7395]) -> [SKIP][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          [SKIP][337] ([Intel XE#2505] / [Intel XE#7447]) -> [SKIP][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][339] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][340] +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][341] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][343] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][345] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) -> [SKIP][346] +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          [SKIP][347] ([Intel XE#6813]) -> [SKIP][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_pm_rpm@package-g7.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          [SKIP][349] ([Intel XE#6814] / [Intel XE#7428]) -> [SKIP][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][351] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][352] +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][353] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][354] +20 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][355] ([Intel XE#1489]) -> [SKIP][356] +39 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][357] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][358] +3 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][359] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][360] +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][361] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][362] +10 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          [SKIP][363] ([Intel XE#1406]) -> [SKIP][364] +22 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr@pr-no-drrs.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][365] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][366] +63 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][367] ([Intel XE#2234]) -> [SKIP][368]
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_psr@psr2-primary-render.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][369] ([Intel XE#7795]) -> [SKIP][370] +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][371] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][372] +7 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][373] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][374] +10 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][375] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][376] +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][377] ([Intel XE#1127] / [Intel XE#5813]) -> [SKIP][378] +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][379] ([Intel XE#2413]) -> [SKIP][380] +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][381] ([Intel XE#1435]) -> [SKIP][382] +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          [SKIP][383] ([Intel XE#1435]) -> [SKIP][384] +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][385] ([Intel XE#6503]) -> [SKIP][386] +12 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][387] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][388]
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][389] ([Intel XE#362] / [Intel XE#5848]) -> [SKIP][390] +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-bmg:          [SKIP][391] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][392]
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][393] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][394]
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_vrr@lobf.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][395] ([Intel XE#1499]) -> [SKIP][396] +7 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_vrr@max-min.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][397] ([Intel XE#1499]) -> [SKIP][398] +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_vrr@negative-basic.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_vrr@negative-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          [SKIP][399] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][400] +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          [SKIP][401] ([Intel XE#7644]) -> [SKIP][402] +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_ccs@vm-bind-fault-mode-decompress.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          [SKIP][403] ([Intel XE#1447] / [Intel XE#7469]) -> [SKIP][404]
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          [SKIP][405] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391]) -> [SKIP][406]
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_compute@eu-busy-10s.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_compute@eu-busy-10s.html
    - shard-bmg:          [SKIP][407] ([Intel XE#6599]) -> [SKIP][408] +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_compute@eu-busy-10s.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-lnl:          [SKIP][409] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346]) -> [SKIP][410] +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          [SKIP][411] ([Intel XE#8428]) -> [SKIP][412]
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_configfs@survivability-mode.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_configfs@survivability-mode.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          [SKIP][413] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457]) -> [SKIP][414]
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_create@create-big-vram.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          [SKIP][415] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944]) -> [SKIP][416]
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_create@multigpu-create-massive-size.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_create@multigpu-create-massive-size.html
    - shard-bmg:          [SKIP][417] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][418]
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          [SKIP][419] ([Intel XE#7636]) -> [SKIP][420] +72 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_eudebug@basic-vm-access-faultable.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][421] ([Intel XE#7636]) -> [SKIP][422] +65 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          [SKIP][423] ([Intel XE#4518] / [Intel XE#7404]) -> [SKIP][424] +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          [SKIP][425] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464]) -> [SKIP][426] +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          [SKIP][427] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][428] +59 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_evict@evict-beng-large-external-cm.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][429] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][430] +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][431] ([Intel XE#8370]) -> [SKIP][432] +7 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_evict@evict-threads-small-multi-queue.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          [SKIP][433] ([Intel XE#7482]) -> [SKIP][434] +107 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][435] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][436] +44 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          [SKIP][437] ([Intel XE#1392]) -> [SKIP][438] +48 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][439] ([Intel XE#8374]) -> [SKIP][440] +63 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          [SKIP][441] ([Intel XE#8374]) -> [SKIP][442] +69 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          [SKIP][443] ([Intel XE#8364]) -> [SKIP][444] +160 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][445] ([Intel XE#8364]) -> [SKIP][446] +148 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-priority.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][447] ([Intel XE#8369]) -> [SKIP][448] +9 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          [SKIP][449] ([Intel XE#8369]) -> [SKIP][450] +11 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_exec_reset@multi-queue-gt-reset.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][451] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][452]
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-lnl:          [SKIP][453] ([Intel XE#6196]) -> [SKIP][454] +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-lnl:          [SKIP][455] ([Intel XE#8378]) -> [SKIP][456] +50 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][457] ([Intel XE#8378]) -> [SKIP][458] +46 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          [SKIP][459] ([Intel XE#7954]) -> [SKIP][460]
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_gpgpu_fill@offset-4x4.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_gpgpu_fill@offset-4x4.html
    - shard-bmg:          [SKIP][461] ([Intel XE#7954]) -> [SKIP][462]
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_gpgpu_fill@offset-4x4.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][463] ([Intel XE#2833]) -> [SKIP][464]
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html
    - shard-bmg:          [SKIP][465] ([Intel XE#2833]) -> [SKIP][466]
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_live_ktest@xe_eudebug.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          [SKIP][467] ([Intel XE#7980]) -> [SKIP][468] +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_madvise@atomic-global.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_madvise@atomic-global.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          [SKIP][469] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408]) -> [SKIP][470] +3 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_mmap@pci-membarrier.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          [SKIP][471] ([Intel XE#512] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][472]
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_mmap@small-bar.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_mmap@small-bar.html
    - shard-bmg:          [SKIP][473] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][474]
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_mmap@small-bar.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          [SKIP][475] ([Intel XE#1416]) -> [SKIP][476]
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_mmap@vram.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [SKIP][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][503], [PASS][504], [PASS][505], [PASS][506], [SKIP][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [PASS][515], [PASS][516], [PASS][517], [PASS][518], [PASS][519], [PASS][520], [PASS][521], [PASS][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], [PASS][528])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [SKIP][542], [PASS][543], [PASS][544], [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549], [PASS][550], [PASS][551], [PASS][552], [PASS][553], [PASS][554]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][555], [PASS][556], [PASS][557], [PASS][558], [PASS][559], [SKIP][560], [PASS][561], [PASS][562], [PASS][563], [PASS][564], [PASS][565], [PASS][566], [PASS][567], [PASS][568], [PASS][569], [PASS][570], [PASS][571], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PASS][578], [PASS][579], [PASS][580])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-lnl:          [SKIP][581] ([Intel XE#6964]) -> [SKIP][582] +17 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          [SKIP][583] ([Intel XE#6964]) -> [SKIP][584] +15 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-lnl:          [SKIP][585] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406]) -> [SKIP][586]
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_noexec_ping_pong@basic.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_non_msix@walker-interrupt-notification-non-msix:
    - shard-bmg:          [SKIP][587] ([Intel XE#7622]) -> [SKIP][588]
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
    - shard-lnl:          [SKIP][589] ([Intel XE#7622]) -> [SKIP][590]
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_non_msix@walker-interrupt-notification-non-msix.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          [SKIP][591] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][592]
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          [SKIP][593] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][594]
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][595] ([Intel XE#7793]) -> [SKIP][596] +10 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          [SKIP][597] ([Intel XE#7793]) -> [SKIP][598] +10 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_page_reclaim@binds-null-vma.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          [SKIP][599] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590]) -> [SKIP][600]
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pat@pat-index-xehpc.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          [SKIP][601] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][602]
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][603] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][604]
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          [SKIP][605] ([Intel XE#7590] / [Intel XE#979]) -> [SKIP][606]
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-lnl:          [FAIL][607] ([Intel XE#7695]) -> [SKIP][608] +2 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_pat@pat-sw-hw-reset-compare.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_pat@pat-sw-hw-reset-compare.html
    - shard-bmg:          [FAIL][609] ([Intel XE#7695]) -> [SKIP][610] +2 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-lnl:          [SKIP][611] ([Intel XE#7590] / [Intel XE#7772]) -> [SKIP][612] +2 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pat@xa-app-transient-media-off.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_pat@xa-app-transient-media-off.html
    - shard-bmg:          [SKIP][613] ([Intel XE#7590]) -> [SKIP][614] +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          [SKIP][615] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][616] +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_peer2peer@read.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][617] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][618] +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_peer2peer@write.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][619] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) -> [SKIP][620] +5 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pm@d3cold-basic.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          [SKIP][621] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][622]
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_pm@d3cold-i2c.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          [SKIP][623] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][624]
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          [SKIP][625] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][626]
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pm@d3cold-mocs.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][627] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][628] +5 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          [SKIP][629] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][630]
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pm@d3hot-i2c.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][631] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][632]
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          [SKIP][633] ([Intel XE#1948]) -> [SKIP][634]
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          [SKIP][635] ([Intel XE#584] / [Intel XE#7369]) -> [SKIP][636] +9 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_pm@s3-mocs.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          [SKIP][637] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456]) -> [SKIP][638]
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][639] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517]) -> [SKIP][640]
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          [SKIP][641] ([Intel XE#4650] / [Intel XE#7347]) -> [SKIP][642] +2 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          [SKIP][643] ([Intel XE#7599]) -> [SKIP][644]
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_prefetch_fault@prefetch-fault.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_prefetch_fault@prefetch-fault.html
    - shard-bmg:          [SKIP][645] ([Intel XE#7599]) -> [SKIP][646]
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fault.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][647] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][648] +11 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][649] ([Intel XE#944]) -> [SKIP][650] +13 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          [SKIP][651] ([Intel XE#944]) -> [SKIP][652] +14 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_query@multigpu-query-pxp-status.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:
    - shard-lnl:          [SKIP][653] ([Intel XE#7174]) -> [SKIP][654] +7 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          [SKIP][655] ([Intel XE#4130] / [Intel XE#7366]) -> [SKIP][656] +5 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          [SKIP][657] ([Intel XE#7569]) -> [SKIP][658]
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_sriov_flr@flr-basic.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_sriov_flr@flr-basic.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          [SKIP][659] ([Intel XE#3342]) -> [SKIP][660] +1 other test skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          [FAIL][661] ([Intel XE#6569]) -> [SKIP][662]
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          [SKIP][663] ([Intel XE#4273]) -> [SKIP][664]
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_sriov_flr@flr-vfs-parallel.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          [SKIP][665] ([Intel XE#8339]) -> [SKIP][666] +4 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  * igt@xe_sriov_vfio@region-info:
    - shard-lnl:          [SKIP][667] ([Intel XE#7724]) -> [SKIP][668] +2 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_sriov_vfio@region-info.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_sriov_vfio@region-info.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          [SKIP][669] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422]) -> [SKIP][670] +2 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_sriov_vram@vf-access-beyond.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_survivability@i2c-functionality:
    - shard-lnl:          [SKIP][671] ([Intel XE#8415]) -> [SKIP][672] +1 other test skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_survivability@i2c-functionality.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_survivability@i2c-functionality.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          [SKIP][673] ([Intel XE#5745] / [Intel XE#7892]) -> [SKIP][674]
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_vm@out-of-memory.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_vm@out-of-memory.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-lnl:          [SKIP][675] ([Intel XE#7892]) -> [SKIP][676] +3 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
Known issues
------------

  Here are the changes found in xe-pw-169094v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-lnl:          [PASS][677] -> [SKIP][678] ([Intel XE#7935])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][679] ([Intel XE#7935])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][680] -> [SKIP][681] ([Intel XE#7935]) +1 other test skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
  [Intel XE#7477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7477
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8416
  [Intel XE#8428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8982 -> IGT_8983
  * Linux: xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82 -> xe-pw-169094v1

  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8983: f37c260e2c935b4a2885cfd650900c341a7c752b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef5229b84e8a44d983de82
  xe-pw-169094v1: 169094v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/index.html

--===============1514427374349739005==
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
<tr><td><b>Series:</b></td><td>Couple fdinfo improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169094/">https://patchwork.freedesktop.org/series/169094/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169094v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169094v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d=
983de82_FULL -&gt; xe-pw-169094v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169094v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-169094v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1690=
94v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_flip=
@wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_flip@wf_vblank-ts-che=
ck.html">SKIP</a> +3346 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-malloc-madvise.html">SKIP</a> +178 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_exec_=
system_allocator@twice-new-prefetch.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_exec_s=
ystem_allocator@twice-new-prefetch.html">SKIP</a> +3353 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_pat@pat-index-auto.html">S=
KIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@asahi/asahi_get_params@get-params:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@asahi/as=
ahi_get_params@get-params.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8416">Intel XE#8416</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@asahi=
/asahi_get_params@get-params.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@asahi/asahi_get_time@get-time-flags-uint64-max:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@asahi/as=
ahi_get_time@get-time-flags-uint64-max.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8416">Intel XE#8416</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bm=
g-2/igt@asahi/asahi_get_time@get-time-flags-uint64-max.html">SKIP</a> +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@intel_hw=
mon@hwmon-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1125">Intel XE#1125</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7312">Intel XE#7312</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@in=
tel_hwmon@hwmon-read.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_addf=
b_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5=
/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fen=
cing.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel =
XE#3658</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7360">Intel XE#7360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_big_=
fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Inte=
l XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169094v1/shard-lnl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_big=
_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Int=
el XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169094v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate=
-180-hflip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_b=
ig_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/ig=
t@kms_big_fb@y-tiled-addfb.html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/ig=
t@kms_big_fb@y-tiled-addfb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard=
-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a>=
 +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">S=
KIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x=
1080p.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x=
1440p.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_bw@l=
inear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-5/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-ln=
l-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +76 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389"=
>Intel XE#7389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bm=
g-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_ccs@=
random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4=
/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> +71 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> +1 other =
test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@k=
ms_cdclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10=
/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_cham=
elium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_cham=
elium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/ig=
t@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_cha=
melium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP<=
/a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_cham=
elium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-=
lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a>=
 +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a></=
li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/=
shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2=
/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_cont=
ent_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP=
</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-=
lnl-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-9/igt@kms_content_protection@legacy.html">SKIP</a> +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-6/igt@kms_content_protection@mei-interface.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@k=
ms_content_protection@suspend-resume.html">SKIP</a> +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_cont=
ent_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_cur=
sor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> +25 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +7 other =
tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/=
shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> +=
22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">SKI=
P</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> +2=
 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_cursor_legacy@sh=
ort-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_dir=
tyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_dir=
tyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1=
0/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-2/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6=
/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1=
/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7477">Intel XE#7477</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_dsc@=
dsc-basic-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_dsc@dsc=
-basic-bigjoiner.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_dsc@=
dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/i=
gt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel =
XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-=
tests.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Int=
el XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169094v1/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-v=
isible-area.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/i=
gt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@k=
ms_fbcon_fbt@psr-suspend.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/702">Intel XE#702</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
1/igt@kms_feature_discovery@display-2x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/703">Intel XE#703</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
3/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bm=
g-5/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-ln=
l-4/igt@kms_feature_discovery@display-4x.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bm=
g-4/igt@kms_feature_discovery@display-4x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/=
igt@kms_feature_discovery@dp-mst.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_fea=
ture_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_featu=
re_discovery@dp-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/ig=
t@kms_feature_discovery@psr1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/i=
gt@kms_feature_discovery@psr2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/ig=
t@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> +41 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms=
_flip@flip-vs-absolute-wf_vblank.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_flip@=
flip-vs-expired-vblank.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Int=
el XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7349">Intel XE#7349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp=
-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">I=
ntel XE#7179</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-169094v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-=
to-32bpp-yuv-linear-reflect-x.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">I=
ntel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7349">Intel XE#7349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel X=
E#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7385">Intel XE#7385</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_flip_scaled_crc@=
flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#=
7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftil=
e-to-16bpp-yftile-upscaling.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE=
#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-16bpp-ytile-downscaling.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#71=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9094v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-=
reflect-x.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_forc=
e_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/i=
gt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel=
 XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169094v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> +253 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v=
1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.=
html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v=
1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff=
.html">SKIP</a> +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE=
#6312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169094v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri=
-indfb-draw-blt.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> +297 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169094v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-d=
raw-blt.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">In=
tel XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169094v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616=
f-draw-render.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169094v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-bl=
t.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> +=
1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> +294 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905=
">Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscr=
n-pri-indfb-draw-render.html">SKIP</a> +213 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#786=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">S=
KIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_hdmi=
_inject@inject-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_hdmi_inje=
ct@inject-4k.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/=
igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@kms_hdmi_i=
nject@inject-audio.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_hdr@invalid-hdr=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg=
-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2=
/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +3 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1=
0/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#=
7443</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169094v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#=
7294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169094v1/shard-lnl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_mst@=
mst-suspend-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8348">Intel XE#8348</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_mst@ms=
t-suspend-read-crc.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@kms_mst@=
mst-suspend-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8348">Intel XE#8348</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_mst@m=
st-suspend-read-crc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bm=
g-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-ln=
l-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel =
XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SK=
IP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel =
XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plan=
e@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">=
SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_plan=
e@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Inte=
l XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169094v1/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-m=
odifier-source-clamping.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@k=
ms_plane_lowres@tiling-x.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@kms_plane_lowre=
s@tiling-y.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg=
-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/=
igt@kms_plane_multiple@tiling-yf.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/=
igt@kms_plane_multiple@tiling-yf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@km=
s_plane_scaling@intel-max-src-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-75.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094=
v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel X=
E#7760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_pm_d=
c@dc3co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8395">Intel XE#8395</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@kms_pm_dc@dc3=
co-after-dc6.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-framegap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8395">Intel XE#8395</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@kms_pm_dc@=
dc3co-vpb-framegap.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_d=
c@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_pm_dc@d=
c5-dpms-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@kms_pm=
_dc@dc5-pageflip-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2=
/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1=
0/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_d=
c@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.htm=
l">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_p=
m_dc@deep-pkgc.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms_p=
m_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094=
v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#8=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9094v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@kms_pm_r=
pm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@kms=
_pm_rpm@package-g7.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9094v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html=
">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> +39=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-ln=
l-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-=
9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@kms_psr@=
pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@kms_psr@pr-no-drrs.h=
tml">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_psr@=
psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_=
psr@psr2-no-drrs.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_psr=
@psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@kms_psr@ps=
r2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE=
#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169094v1/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</=
a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#581=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">=
SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SK=
IP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-6/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@k=
ms_setmode@invalid-clone-single-crtc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@kms_shar=
pness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">=
SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#=
5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169094v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chameliu=
m.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7444">Intel XE#7444</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@kms_vrr@lobf=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@kms_vrr@max-min.html">S=
KIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@kms_vrr@negative=
-basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE=
#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169094v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-al=
l.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_ccs@v=
m-bind-fault-mode-decompress.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe=
_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_compu=
te@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7469">Intel XE#7469</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-=
lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_compu=
te@eu-busy-10s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6592">Intel XE#6592</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-6/igt@xe_compute@eu-busy-10s.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_compu=
te@eu-busy-10s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_compute@eu-bu=
sy-10s.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_compu=
te_preempt@compute-preempt-many-vram-evict.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316">Intel XE=
#7316</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7346">Intel XE#7346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-=
many-vram-evict.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_confi=
gfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8428">Intel XE#8428</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_confi=
gfs@survivability-mode.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_creat=
e@create-big-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-6/igt@xe_create@create-big-vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel X=
E#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169094v1/shard-lnl-2/igt@xe_create@multigpu-create-massive-size.html">SKIP=
</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel =
XE#7350</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-9/igt@xe_create@multigpu-create-massive-size.html">SK=
IP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_eudeb=
ug@basic-vm-access-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe=
_eudebug@basic-vm-access-faultable.html">SKIP</a> +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_eudeb=
ug_online@set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/=
igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> +65 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4518">Intel XE#4518</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7404">Intel XE#7404</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/i=
gt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_evict=
@evict-beng-large-external-cm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard=
-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> +59 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a>=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_evict=
@evict-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/i=
gt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_=
balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-r=
ace.html">SKIP</a> +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> +44 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_=
basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/ig=
t@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> +48 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_exec_=
fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-=
4/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> +63 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_exec_=
fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-=
lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> +=
69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SK=
IP</a> +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_=
multi_queue@two-queues-priority.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-4/ig=
t@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> +148 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_=
reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/ig=
t@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_exec_=
reset@multi-queue-gt-reset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_e=
xec_reset@multi-queue-gt-reset.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_exec_=
system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Int=
el XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169094v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-pre=
fetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE=
#6196</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169094v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-wt-single-vma.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1=
/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.ht=
ml">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel =
XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169094v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-share=
d-vm-userptr-rebind.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_gpgpu=
_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7954">Intel XE#7954</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_gpgpu_fill@=
offset-4x4.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_gpgp=
u_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7954">Intel XE#7954</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_gpgpu_fill=
@offset-4x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_live=
_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_live_ktest=
@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_madvi=
se@atomic-global.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7980">Intel XE#7980</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_madvise@ato=
mic-global.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_mmap@=
pci-membarrier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-3/igt@xe_mmap@pci-membarrier.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/512">Intel XE#512</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3=
/igt@xe_mmap@small-bar.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5=
/igt@xe_mmap@small-bar.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_mmap@=
vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1416">Intel XE#1416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_mmap@vram.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983=
de82/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44=
d983de82/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e=
8a44d983de82/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229=
b84e8a44d983de82/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef=
5229b84e8a44d983de82/shard-lnl-7/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9e=
cdef5229b84e8a44d983de82/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517=
bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a=
1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b281=
7f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-=
b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de8=
2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de8=
2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d98=
3de82/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a4=
4d983de82/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b8=
4e8a44d983de82/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5=
229b84e8a44d983de82/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ec=
def5229b84e8a44d983de82/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517b=
c9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1=
517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_module_load@load.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817=
f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5294-b=
2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-52=
94-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de8=
2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d98=
3de82/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169094v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169094v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169094v1/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-7/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169094v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_multi=
gpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/ig=
t@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-8/igt@xe_multi=
gpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-b=
mg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_noexe=
c_ping_pong@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7324">Intel XE#7324</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-2/igt@xe_noexec_ping_pong@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_non_m=
six@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-bmg-9/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</=
a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_non_m=
six@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-7/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-lnl-2/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-2/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sha=
rd-bmg-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_page_=
reclaim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_page_rec=
laim@basic-mixed.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_page_=
reclaim@binds-null-vma.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-5/igt@xe_page_=
reclaim@binds-null-vma.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1420">Intel XE#1420</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1420">Intel XE#1420</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-9/igt@xe=
_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2236">Intel XE#2236</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-10/igt@x=
e_pat@pat-index-xelpg.html">SKIP</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_p=
at@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_pat@p=
at-sw-hw-reset-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_pat@p=
at-sw-hw-reset-compare.html">SKIP</a> +2 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_pat@p=
at-sw-hw-reset-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/igt@xe_pat@p=
at-sw-hw-reset-compare.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-l=
nl-6/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> +2 other tests sk=
ip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-4/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-1/igt@xe_pa=
t@xa-app-transient-media-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-5/igt@xe_peer2peer@read.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_peer2=
peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#735=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-=
1/igt@xe_pm@d3cold-basic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-5/igt@xe_pm@d3=
cold-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@d=
3cold-mocs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/i=
gt@xe_pm@d3cold-multiple-execs.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4=
/igt@xe_pm@d3hot-i2c.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-1/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2=
/igt@xe_pm@d3hot-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pm@d3=
hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@d3hot-mmap-=
vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_pm@s3=
-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7369">Intel XE#7369</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@xe_pm@s3-mocs=
.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7347">Intel XE#7347</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/s=
hard-lnl-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_prefe=
tch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-4/igt@xe_pre=
fetch_fault@prefetch-fault.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_prefe=
tch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-8/igt@xe_pre=
fetch_fault@prefetch-fault.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-5/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#741=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
094v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">=
SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-9/igt@xe_query=
@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-3/ig=
t@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> +13 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_query=
@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_que=
ry@multigpu-query-pxp-status.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_sriov=
_admin@bulk-exec-quantum-vfs-disabled.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl=
-5/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html">SKIP</a> +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@xe_sriov=
_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v=
1/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a>=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_sriov=
_flr@flr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7569">Intel XE#7569</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-7/igt@xe_sriov_flr@flr=
-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-2/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_sriov_flr=
@flr-vf1-clear.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-3/igt@xe_sriov=
_flr@flr-vf1-clear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-2/igt@xe_sriov_flr=
@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-6/igt@xe_sriov=
_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-2/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-7/igt@xe_sriov=
_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/sh=
ard-lnl-3/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SK=
IP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-1/igt@xe_sriov=
_vfio@region-info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7724">Intel XE#7724</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_sriov_vfio=
@region-info.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_sriov=
_vram@vf-access-beyond.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1690=
94v1/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-4/igt@xe_survi=
vability@i2c-functionality.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-3/igt@xe_s=
urvivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_vm@ou=
t-of-memory.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5745">Intel XE#5745</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-6/igt@xe_vm=
@out-of-memory.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-8/igt@xe_vm@ov=
ercommit-nonfault-vram-lr-external-nodefer.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shar=
d-lnl-1/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html">SKIP</=
a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169094v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-lnl-5/igt@kms_curs=
or_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-lnl-8/igt@kms_cursor_le=
gacy@cursor-vs-flip-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-f=
lip-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82/shard-bmg-10/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169094v1/shard-bmg-6/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#=
7935</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8982 -&gt; IGT_8983</li>
<li>Linux: xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82 -&gt; xe-pw-169=
094v1</li>
</ul>
<p>IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8983: f37c260e2c935b4a2885cfd650900c341a7c752b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5294-b2817f6a1517bc9ecdef5229b84e8a44d983de82: b2817f6a1517bc9ecdef522=
9b84e8a44d983de82<br />
  xe-pw-169094v1: 169094v1</p>

</body>
</html>

--===============1514427374349739005==--
