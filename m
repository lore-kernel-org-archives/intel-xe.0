Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8658CC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 23:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1745710E1BE;
	Fri, 23 May 2025 23:38:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B207310E1B3;
 Fri, 23 May 2025 23:37:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4668637951710344228=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/sched=3A_stop_re-su?=
 =?utf-8?q?bmitting_signalled_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 May 2025 23:37:58 -0000
Message-ID: <174804347869.18585.15034770771953774138@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523113608.121553-2-matthew.auld@intel.com>
In-Reply-To: <20250523113608.121553-2-matthew.auld@intel.com>
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

--===============4668637951710344228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sched: stop re-submitting signalled jobs
URL   : https://patchwork.freedesktop.org/series/149426/
State : failure

== Summary ==

CI Bug Log - changes from xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848_FULL -> xe-pw-149426v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149426v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149426v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149426v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@gt-reset:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@xe_exec_reset@gt-reset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@xe_exec_reset@gt-reset.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] +2 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_reset@virtual-gt-reset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_exec_reset@virtual-gt-reset.html

  
#### Warnings ####

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][10] ([Intel XE#3868]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@xe_exec_reset@cat-error.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          [SKIP][12] ([Intel XE#4045]) -> [SKIP][13] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-8/igt@xe_mmap@pci-membarrier.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         [SKIP][14] ([Intel XE#4045]) -> [SKIP][15] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-9/igt@xe_mmap@pci-membarrier-parallel.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-parallel.html

  
Known issues
------------

  Here are the changes found in xe-pw-149426v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#4665])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1125])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2233])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][19] -> [FAIL][20] ([Intel XE#3884]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2370])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1407]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2328])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#4543]) +11 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [ABORT][31] ([Intel XE#4760])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#367]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2907]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3862]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#787]) +76 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4416]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2325]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178]) +3 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#307])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2341])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3278])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1188])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#308])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2321]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2320]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2321])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#323])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2286]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#4173]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4302])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4422])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4422]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#776])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2372])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#301] / [Intel XE#3321])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#3321]) +2 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#3321]) +5 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2316]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2316])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#2882]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][87] -> [FAIL][88] ([Intel XE#301]) +3 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][89] ([Intel XE#301]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#301]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#301] / [Intel XE#3321])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][95] -> [INCOMPLETE][96] ([Intel XE#2049] / [Intel XE#2597]) +2 other tests incomplete
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][97] ([Intel XE#2049] / [Intel XE#2597])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#886]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2380]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2293]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#651]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +12 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +31 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4141]) +13 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2312]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#656]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#653]) +11 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2313]) +31 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#656])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3374] / [Intel XE#3544])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][115] -> [SKIP][116] ([Intel XE#455])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2927])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2934])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4329])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#616]) +3 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#616]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2393])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#5020])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][125] -> [DMESG-WARN][126] ([Intel XE#4212])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][127] -> [ABORT][128] ([Intel XE#4760]) +1 other test abort
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2763]) +11 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2763]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#870])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#870]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2391])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2392])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2505])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1439] / [Intel XE#836])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1439] / [Intel XE#3141])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2893])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2893] / [Intel XE#4608])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#4608]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1489]) +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1489]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1128])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1406])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4609])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2939])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1127]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1127])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1127])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2330])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2413])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][156] -> [FAIL][157] ([Intel XE#2883]) +2 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1435])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#330])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1499])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#756])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#756])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#756]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#756]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1091] / [Intel XE#2849])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#4497])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4837]) +14 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#4837]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4837]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4518]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#4518])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#688]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][174] -> [SKIP][175] ([Intel XE#1392])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2322]) +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1392]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][178] -> [INCOMPLETE][179] ([Intel XE#4842])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1392])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#288]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#4915]) +128 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_exec_system_allocator@fault-threads-same-page-benchmark.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read-after:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#4915]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#4943]) +27 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#4943]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][186] ([Intel XE#4917])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2229])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#560])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#2457])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2245])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2427])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2284] / [Intel XE#366])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#584])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#2284]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][196] -> [ABORT][197] ([Intel XE#1794])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-4/igt@xe_pm@s4-mocs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][198] -> [ABORT][199] ([Intel XE#1794])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#579])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#4733]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#4733])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#944])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#944]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#4814])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#4130])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#3342])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#3342])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#4351])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][210] ([Intel XE#911]) -> [PASS][211] +3 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#3428]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][216] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][218] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#4208] / [i915#2575]) -> [PASS][221] +10 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][222] ([Intel XE#2291]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][224] ([Intel XE#3009]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_dp_aux_dev.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][226] ([Intel XE#2882]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][228] ([Intel XE#3321]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][232] ([Intel XE#301]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][236] ([Intel XE#4543]) -> [PASS][237] +9 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][238] -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][240] ([Intel XE#718]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_sequence@get-forked-busy:
    - shard-adlp:         [DMESG-WARN][242] ([Intel XE#4173]) -> [PASS][243] +4 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_sequence@get-forked-busy.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@kms_sequence@get-forked-busy.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1392]) -> [PASS][245] +6 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][246] ([Intel XE#5018]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][248] ([Intel XE#3876]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_gt_freq@freq_reset:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208]) -> [PASS][251] +14 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_gt_freq@freq_reset.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_gt_freq@freq_reset.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [SKIP][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277]) ([Intel XE#2457]) -> ([PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][303] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][305] ([Intel XE#1794]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-2/igt@xe_pm@s4-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][307] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][308] ([Intel XE#4543])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][310] ([Intel XE#1124])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208] / [i915#2575]) -> [SKIP][312] ([Intel XE#373])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208] / [i915#2575]) -> [SKIP][314] ([Intel XE#308])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][315] ([Intel XE#2316]) -> [FAIL][316] ([Intel XE#3321])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][317] ([Intel XE#2311]) -> [SKIP][318] ([Intel XE#2312]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][319] ([Intel XE#2312]) -> [SKIP][320] ([Intel XE#2311]) +7 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][321] ([Intel XE#2312]) -> [SKIP][322] ([Intel XE#4141]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][324] ([Intel XE#651])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208]) -> [SKIP][326] ([Intel XE#651])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][327] ([Intel XE#2313]) -> [SKIP][328] ([Intel XE#2312]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][329] ([Intel XE#2312]) -> [SKIP][330] ([Intel XE#2313]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][332] ([Intel XE#653])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208]) -> [SKIP][334] ([Intel XE#653])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][335] ([Intel XE#5021]) -> [SKIP][336] ([Intel XE#4596])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208]) -> [SKIP][338] ([Intel XE#1489]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][340] ([Intel XE#2850] / [Intel XE#929])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#4208]) -> [SKIP][342] ([Intel XE#2850] / [Intel XE#929])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_psr@psr2-dpms.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_psr@psr2-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#362]) -> [FAIL][344] ([Intel XE#1729])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208] / [i915#2575]) -> [SKIP][346] ([Intel XE#455])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_vrr@flip-basic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#4518])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208]) -> [SKIP][350] ([Intel XE#288]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#4208]) -> [SKIP][352] ([Intel XE#4915]) +24 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208]) -> [SKIP][354] ([Intel XE#2541] / [Intel XE#3573])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_oa@disabled-read-error.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4208]) -> [SKIP][356] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pxp@pxp-optout:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [SKIP][358] ([Intel XE#4733])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_pxp@pxp-optout.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_pxp@pxp-optout.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4208]) -> [SKIP][360] ([Intel XE#4130])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8376 -> IGT_8378
  * Linux: xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848 -> xe-pw-149426v1

  IGT_8376: ec202132760d1c4dd968fbafbac962b08ff7289f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8378: ecf2f824914607aa88c9344c5c5eb1f6309966c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848: dad3dc322768427e2ecb1a887cb3b710f8bc6848
  xe-pw-149426v1: 149426v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/index.html

--===============4668637951710344228==
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
<tr><td><b>Series:</b></td><td>drm/xe/sched: stop re-submitting signalled j=
obs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149426/">https://patchwork.freedesktop.org/series/149426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149426v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3131-dad3dc322768427e2ecb1a887cb3b710f=
8bc6848_FULL -&gt; xe-pw-149426v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149426v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149426v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1494=
26v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_reset@gt-reset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@xe_exec_=
reset@gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@xe_exec_reset@gt-reset.html">I=
NCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-8/igt@xe_exec_reset@paral=
lel-gt-reset.html">INCOMPLETE</a> +2 other tests incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_exec_=
reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_exec_reset@paralle=
l-gt-reset.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_reset@par=
allel-gt-reset.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_exec_reset@virtual-gt-rese=
t.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@xe_exec=
_reset@cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-6/igt@xe_exec=
_reset@cat-error.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-8/igt@xe_mmap@=
pci-membarrier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@xe_mmap@pci-memb=
arrier.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-9/igt@xe_mmap=
@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@xe_mm=
ap@pci-membarrier-parallel.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149426v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@intel_hwmon@hwmon-write.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
665">Intel XE#4665</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-6/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-1-displays-3840x2160p.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_content_protection@atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-8/igt@kms_dir=
tyfb@fbc-dirtyfb-ioctl.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-3/igt@kms_dirtyfb@fbc-dirty=
fb-ioctl.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-panning.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panni=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-4=
66/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vbla=
nk@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vbla=
nk@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-in=
terruptible@d-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_flip@wf_vblank=
-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-435/igt@kms_pl=
ane_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_plane_cursor@viewpo=
rt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@=
kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4=
212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel X=
E#4760</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@kms_psr@psr-primary-page-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-3/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-adlp-4/igt@kms_writeback@writeback-fb-i=
d-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_writeback@writeback-fb-=
id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@xe_eudebug@basic-vm-access-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_eudebug_online@preempt-b=
reakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@xe_evict@evict-beng-large-cm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#=
1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_b=
asic@multigpu-once-null-rebind.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-434/igt@xe_exec_fault_mode@once-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_exec_system_allocator@fa=
ult-threads-same-page-benchmark.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +128 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-r=
ead-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-malloc-fork-read-after.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +27 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-4/igt@xe_pm@s3-basic-exec.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-4/igt@xe_pm@s=
4-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149426v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#179=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-7/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_pxp@pxp-termination-key-=
update-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-435/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149426v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_big_=
fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2=
-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_cu=
rsor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1=
/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> +=
10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149426v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
c-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426=
v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a=
6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip=
-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149426v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16=
bpp-xtile-downscaling.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-466/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">INCOMPLETE</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433=
/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_seq=
uence@get-forked-busy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-adlp-2/igt@km=
s_sequence@get-forked-busy.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149426v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149426v1/shard-lnl-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/sha=
rd-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_gt_=
freq@freq_reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_gt_freq@fr=
eq_reset.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc=
6848/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710=
f8bc6848/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3=
b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a88=
7cb3b710f8bc6848/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb=
1a887cb3b710f8bc6848/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e=
2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768=
427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc32=
2768427e2ecb1a887cb3b710f8bc6848/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-dad3=
dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3131-=
dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc684=
8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49426v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49426v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49426v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49426v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49426v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-8/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shar=
d-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149426v1/shard-lnl-5/igt@xe_pm@s4-basic.html">PA=
SS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-adlp-1/igt@kms_big=
_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149426v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_ch=
amelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149426v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution=
-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
426v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-8/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/sh=
ard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149426v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/sha=
rd-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">=
Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149426v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/s=
hard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1494=
26v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v=
1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9426v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149426v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-con=
tinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_ps=
r@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shar=
d-dg2-433/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_ps=
r@psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@kms_psr@psr2-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-433/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@kms_vr=
r@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@km=
s_vrr@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exe=
c_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-463/=
igt@xe_exec_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-new-bo-map.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149426v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-ma=
ny-large-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_oa@=
disabled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-432/igt@xe_oa@dis=
abled-read-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-436/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_pxp=
@pxp-optout.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149426v1/shard-dg2-466/igt@xe_pxp@pxp-optout=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149426v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprov=
ision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8376 -&gt; IGT_8378</li>
<li>Linux: xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848 -&gt; xe-pw-149=
426v1</li>
</ul>
<p>IGT_8376: ec202132760d1c4dd968fbafbac962b08ff7289f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8378: ecf2f824914607aa88c9344c5c5eb1f6309966c7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848: dad3dc322768427e2ecb1a8=
87cb3b710f8bc6848<br />
  xe-pw-149426v1: 149426v1</p>

</body>
</html>

--===============4668637951710344228==--
