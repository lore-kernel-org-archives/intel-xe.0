Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAA8C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B361310E746;
	Tue, 15 Apr 2025 11:25:18 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EE010E746;
 Tue, 15 Apr 2025 11:25:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0367982577207720626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe=3A_Add_fault_injection_for_kobj=5Fxe=5Fhw=5Fengine=5F?=
 =?utf-8?q?class?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 11:25:17 -0000
Message-ID: <174471631747.6225.5689924491793023353@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
In-Reply-To: <20250415064211.2889970-1-sobin.thomas@intel.com>
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

--===============0367982577207720626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add fault injection for kobj_xe_hw_engine_class
URL   : https://patchwork.freedesktop.org/series/147729/
State : failure

== Summary ==

CI Bug Log - changes from xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2_FULL -> xe-pw-147729v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147729v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147729v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147729v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@xe_oa@enable-disable@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_oa@enable-disable@ccs-0.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-bmg:          [PASS][4] -> [TIMEOUT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][8] ([Intel XE#2291]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][10] ([Intel XE#2705]) -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@testdisplay.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@testdisplay.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@gt-frequency@gt0}:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_pmu@gt-frequency@gt0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_pmu@gt-frequency@gt0.html

  
Known issues
------------

  Here are the changes found in xe-pw-147729v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-lnl:          [PASS][14] -> [ABORT][15] ([Intel XE#4624])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#873])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2385])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#4543])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +11 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +225 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3862]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +26 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1727] / [Intel XE#3113])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#3124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4417]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4416]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2341])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1188])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#309]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#323])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2291])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1508])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1340]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#4354])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#4331])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2244]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4422])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4156])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#310]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#2882]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][69] ([Intel XE#3321]) +4 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2316]) +9 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2316]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#2882]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#3321])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#301]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#455]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +21 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#656]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +10 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#658])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2352])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2312]) +11 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#653]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2313]) +18 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2502])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#1503])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_hdr@static-swap.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#346])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#4328])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2934])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#4173]) +1 other test dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#3428]) +6 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][105] ([Intel XE#3428]) +4 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2499])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1489])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1489]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2387])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2939])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][116] -> [FAIL][117] ([Intel XE#2883]) +2 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-2/igt@kms_setmode@basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-9/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2883]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#455])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2426])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#4459]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1499])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_vrr@max-min.html
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#4227]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-5/igt@kms_vrr@max-min.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#756])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2905] / [Intel XE#3889])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2905]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2905]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2322]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#1392]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#288]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#560])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@buffer-fill:
    - shard-lnl:          [PASS][137] -> [FAIL][138] ([Intel XE#4565])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-2/igt@xe_oa@buffer-fill.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-4/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@buffer-fill@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][139] ([Intel XE#4565])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-4/igt@xe_oa@buffer-fill@ccs-0.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2541] / [Intel XE#3573])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_oa@disabled-read-error.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2236])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][142] ([Intel XE#1173])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2284]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][144] -> [ABORT][145] ([Intel XE#1794])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-2/igt@xe_pm@s4-exec-after.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [PASS][146] -> [ABORT][147] ([Intel XE#1794])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#4733])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#4733]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#944])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#944]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#4130])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#4173]) -> [PASS][154] +12 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][155] ([Intel XE#4543]) -> [PASS][156] +2 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2191]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][161] ([Intel XE#2291]) -> [PASS][162] +2 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#309]) -> [PASS][164] +6 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#310]) -> [PASS][166] +5 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][167] ([Intel XE#2316]) -> [PASS][168] +6 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170] +4 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][171] ([Intel XE#886]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - shard-bmg:          [FAIL][173] ([Intel XE#3321]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2:
    - shard-dg2-set2:     [FAIL][177] ([Intel XE#301]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#656]) -> [PASS][184] +10 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][185] ([Intel XE#1503]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][187] ([Intel XE#4596]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#4596]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][191] ([Intel XE#718]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#836]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][195] ([Intel XE#1435]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#455]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1392]) -> [PASS][200] +9 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][201], [PASS][202], [PASS][203], [SKIP][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226]) ([Intel XE#378]) -> ([PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][252] ([Intel XE#3428]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][254] -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-2/igt@xe_pmu@gt-frequency.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#787]) -> [SKIP][257] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][259] ([Intel XE#787]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][260] -> [INCOMPLETE][261] ([Intel XE#3862])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [DMESG-WARN][262] ([Intel XE#3428]) -> [INCOMPLETE][263] ([Intel XE#3862])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][264] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][265] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4418]) -> [SKIP][267] ([Intel XE#4440])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][268] ([Intel XE#1178]) -> [SKIP][269] ([Intel XE#455]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][270] ([Intel XE#1178]) -> [SKIP][271] ([Intel XE#2341])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_content_protection@srm.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][272] ([Intel XE#4354]) -> [DMESG-WARN][273] ([Intel XE#3428])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][274] ([Intel XE#301]) -> [SKIP][275] ([Intel XE#310])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#656]) -> [SKIP][277] ([Intel XE#651]) +17 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][278] ([Intel XE#2311]) -> [SKIP][279] ([Intel XE#2312]) +12 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][280] ([Intel XE#2312]) -> [SKIP][281] ([Intel XE#4141]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][282] ([Intel XE#4141]) -> [SKIP][283] ([Intel XE#2312]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#651]) -> [SKIP][285] ([Intel XE#656]) +14 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][286] ([Intel XE#2312]) -> [SKIP][287] ([Intel XE#2311]) +14 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#2312]) +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#656]) +14 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#656]) -> [SKIP][293] ([Intel XE#653]) +20 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][294] ([Intel XE#2312]) -> [SKIP][295] ([Intel XE#2313]) +14 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#455]) -> [SKIP][297] ([Intel XE#4596])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][298] ([Intel XE#2493]) -> [SKIP][299] ([Intel XE#4596])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#362]) -> [SKIP][301] ([Intel XE#1500])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [DMESG-WARN][309], [PASS][310], [PASS][311], [DMESG-WARN][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326]) ([Intel XE#3428]) -> ([PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [SKIP][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352]) ([Intel XE#2457])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1061]) -> [FAIL][354] ([Intel XE#1173])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_peer2peer@read.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2 -> xe-pw-147729v1

  IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2: 0b6f7071ae34910671f2fadcc0829a960b09c0a2
  xe-pw-147729v1: 147729v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/index.html

--===============0367982577207720626==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add fault=
 injection for kobj_xe_hw_engine_class</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147729/">https://patchwork.freedesktop.org/series/147729/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147729v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147729v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2951-0b6f7071ae34910671f2fadcc0829a960=
b09c0a2_FULL -&gt; xe-pw-147729v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147729v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147729v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1477=
29v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-=
top-edge.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
x.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_oa@enable-disable@ccs-0.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_pm@d3=
hot-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_pm@d3hot-multiple-execs=
.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-b=
mg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@testdi=
splay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@testdisplay.html">ABOR=
T</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@gt-frequency@gt0}:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@xe_pmu=
@gt-frequency@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_pmu@gt-frequency@gt0.h=
tml">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147729v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-4/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-3/igt@intel=
_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_atomic@plane-primary-over=
lay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/s=
hard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +225 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg=
2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edi=
d-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_cu=
rsor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2=
-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_dp=
_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_dp_link_tra=
ining@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_dp=
_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_dp_link=
train_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_flip@2x-dpms-=
vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-=
wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_fl=
ip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-3/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_joiner@basi=
c-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-1/igt@kms_pip=
e_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-1/igt@kms_pipe_crc_basic=
@hang-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-=
6/igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3428">Intel XE#3428</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_plane_scaling@plane-scale=
r-with-clipping-clamping-rotation.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +4 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-2/igt@kms_set=
mode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147729v1/shard-adlp-9/igt@kms_setmode@basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel=
 XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-2/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_setmode@clon=
e-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-4/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147729v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-5/igt@kms_vrr@=
max-min.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-lnl-1/igt@kms_vrr@max-min.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#42=
27</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_writeback@writeback-che=
ck-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_eudebug@discovery-empty.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-o=
ther.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-null.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_exec_basic@mu=
ltigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_exec_fault_mode@many-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-2/igt@xe_oa@bu=
ffer-fill.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147729v1/shard-lnl-4/igt@xe_oa@buffer-fill.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565">Intel X=
E#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-lnl-4/igt@xe_oa@buffer-fill@ccs-0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
565">Intel XE#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_oa@disabled-read-error.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-2/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147729v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-7/igt@xe_pm@s4=
-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147729v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel=
 XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147729v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147729v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-b=
mg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-d=
g2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/=
igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> +5 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg=
-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_flip=
@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@kms_f=
lip@blocking-wf_vblank@b-dp2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-6/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-lnl-6/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1=
/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/sha=
rd-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank@d-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432=
/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-adl=
p-6/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
729v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729=
v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-ono=
ff.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-3/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@k=
ms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-adlp-4/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147729v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@k=
ms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg=
2-434/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147729v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard=
-dg2-435/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b=
09c0a2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc082=
9a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2f=
adcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910=
671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071a=
e34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6=
f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
51-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09=
c0a2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a=
960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadc=
c0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671=
f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34=
910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f70=
71ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-=
0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147729v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47729v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147729v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147729v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-=
432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147729v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@x=
e_pm@s2idle-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-lnl-2/igt@xe_pmu@g=
t-frequency.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147729v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729=
v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms=
_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#34=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-d=
p-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-sst.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-=
dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14772=
9v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147729v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147729v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147729v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
29v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729=
v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147729v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-466/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/sha=
rd-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/s=
hard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0=
a2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b=
09c0a2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a=
960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2=
fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae349106=
71f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34=
910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b=
6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-295=
1-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bmg-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/=
shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c=
0a2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829a960=
b09c0a2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc0829=
a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2951-0b6f7071ae34910671f2fadcc=
0829a960b09c0a2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#342=
8</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147729v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147729v1/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7729v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147729v1/shard-dg2-434/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2 -&gt; xe-pw-147=
729v1</li>
</ul>
<p>IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2951-0b6f7071ae34910671f2fadcc0829a960b09c0a2: 0b6f7071ae34910671f2fad=
cc0829a960b09c0a2<br />
  xe-pw-147729v1: 147729v1</p>

</body>
</html>

--===============0367982577207720626==--
