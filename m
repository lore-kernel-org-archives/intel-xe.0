Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E71CC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 02:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6E10E7E6;
	Wed, 21 Aug 2024 02:35:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393010E2AE;
 Wed, 21 Aug 2024 02:35:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1755334990019682546=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_identify_di?=
 =?utf-8?q?splay_steppings_in_display_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 02:35:45 -0000
Message-ID: <172420774500.717251.11004985152526602066@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724180287.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724180287.git.jani.nikula@intel.com>
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

--===============1755334990019682546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: identify display steppings in display code
URL   : https://patchwork.freedesktop.org/series/137533/
State : failure

== Summary ==

CI Bug Log - changes from xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b_full -> xe-pw-137533v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137533v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137533v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137533v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [ABORT][1] +10 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-lnl:          NOTRUN -> [FAIL][2] +10 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +9 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_flip@blocking-absolute-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-9/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-6/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-9/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-9/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-2/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-2/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-9/igt@runner@aborted.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-433/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-433/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-432/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-434/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-434/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-433/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-434/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-432/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-432/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html

  * igt@testdisplay:
    - shard-lnl:          [PASS][49] -> [FAIL][50] +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@testdisplay.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@testdisplay.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][51] -> [DMESG-WARN][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][53] ([Intel XE#1399]) -> [FAIL][54] +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          [SKIP][55] ([Intel XE#373]) -> [FAIL][56] +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][57] ([Intel XE#599]) -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_content_protection@uevent.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-lnl:          [SKIP][59] ([Intel XE#1421]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][61] ([Intel XE#1397] / [Intel XE#1745]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][63] ([Intel XE#656]) -> [FAIL][64] +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][65] ([Intel XE#1503] / [Intel XE#599]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          [SKIP][67] ([Intel XE#756]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          [SKIP][69] ([Intel XE#1392]) -> [ABORT][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@crc@pipe-a-dp-2:
    - {shard-bmg}:        NOTRUN -> [DMESG-FAIL][71]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-4/igt@kms_async_flips@crc@pipe-a-dp-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - {shard-bmg}:        NOTRUN -> [FAIL][72] +5 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][73] ([Intel XE#1178]) -> [INCOMPLETE][74] +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@xe_evict@evict-small-external-cm:
    - {shard-bmg}:        NOTRUN -> [ABORT][75] +1 other test abort
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_pat@pat-index-xe2:
    - {shard-bmg}:        [PASS][76] -> [INCOMPLETE][77] +3 other tests incomplete
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-1/igt@xe_pat@pat-index-xe2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-5/igt@xe_pat@pat-index-xe2.html

  * igt@xe_query@multigpu-query-hwconfig:
    - {shard-bmg}:        [SKIP][78] ([Intel XE#944]) -> [ABORT][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:
    - {shard-bmg}:        [PASS][80] -> [ABORT][81] +7 other tests abort
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html

  
Known issues
------------

  Here are the changes found in xe-pw-137533v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1125])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#664])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1407]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1124]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1467]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@basic:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#346]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2191])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1512])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#367])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1399]) +16 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#306]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#373]) +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#307])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1413]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1424]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#323])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#309]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#599]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1421]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1397] / [Intel XE#1745])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1397])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#352])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +17 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1469])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#656]) +67 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1503] / [Intel XE#599])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][110] -> [DMESG-FAIL][111] ([Intel XE#324]) +2 other tests dmesg-fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-2:
    - shard-lnl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#324])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#498]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2318]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#870])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#736])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1439]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1406]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1437]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1127])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1435])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#362])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][124] ([Intel XE#2443]) +3 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1091])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#688]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +14 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#378])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2248]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1420])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1061]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2284])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1948])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2284] / [Intel XE#366])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#584]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#579])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][138] ([Intel XE#1760])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][139] ([Intel XE#1659]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][141] ([Intel XE#886]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_vblank@wait-busy:
    - {shard-bmg}:        [ABORT][143] -> [PASS][144] +8 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-3/igt@kms_vblank@wait-busy.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-8/igt@kms_vblank@wait-busy.html

  * igt@kms_vblank@wait-busy@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][145] -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-3/igt@kms_vblank@wait-busy@pipe-d-hdmi-a-3.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-8/igt@kms_vblank@wait-busy@pipe-d-hdmi-a-3.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-lnl:          [ABORT][147] -> [PASS][148] +12 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          [ABORT][149] -> [SKIP][150] ([Intel XE#1124])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7979 -> IGT_7980
  * Linux: xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b -> xe-pw-137533v1

  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0feb238bedde6a9d3b
  xe-pw-137533v1: 137533v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/index.html

--===============1755334990019682546==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: identify display steppings=
 in display code</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137533/">https://patchwork.freedesktop.org/series/137533/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137533v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137533v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1800-aadc820a10ab50bd57179c0feb238bedd=
e6a9d3b_full -&gt; xe-pw-137533v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137533v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137533v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1375=
33v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rota=
te-0.html">ABORT</a> +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-=
top-edge.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_flip=
@blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip@blockin=
g-absolute-wf_vblank.html">ABORT</a> +9 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbla=
nk@b-edp1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/sha=
rd-adlp-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13753=
3v1/shard-adlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137533v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-6/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-137533v1/shard-adlp-1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-a=
dlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/=
shard-adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7533v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-137533v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-2/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137533v1/shard-adlp-2/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-adlp-9/=
igt@runner@aborted.html">FAIL</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137533v1/shard-dg2-433/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/sh=
ard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-433/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7533v1/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137533v1/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137533v1/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg=
2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1=
/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-434/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137533v1/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137533v1/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard=
-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-435/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13753=
3v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-466/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137533v1/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-dg2-463/igt@ru=
nner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@testdisp=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-137533v1/shard-lnl-6/igt@testdisplay.html">FAIL</a> +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-2/igt@xe_exec_=
threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-=
5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMES=
G-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_cham=
elium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/ig=
t@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">FAIL</a> +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_content=
_protection@uevent.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip@=
2x-flip-vs-wf_vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile=
-to-16bpp-4tile-downscaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137533v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-mmap-wc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/=
igt@kms_hdr@invalid-metadata-sizes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_writ=
eback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_writeba=
ck@writeback-fb-id.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/sha=
rd-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">ABOR=
T</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-bmg-4/igt@kms_async_flips@crc@pipe-a-dp=
-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hd=
mi-a-3.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bm=
g-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a>=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-bmg-1/igt@xe_evict@evict-small-external=
-cm.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-1/igt@xe_pat@p=
at-index-xe2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-137533v1/shard-bmg-5/igt@xe_pat@pat-index-xe2.html">INCOM=
PLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-6/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-5/igt@xe_query=
@multigpu-query-hwconfig.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-6/igt@xe_vm@mu=
nmap-style-unbind-userptr-inval-many-front.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-1/igt@xe=
_vm@munmap-style-unbind-userptr-inval-many-front.html">ABORT</a> +7 other t=
ests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137533v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_big_joiner@basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"=
>Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1413">Intel XE#1413</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1424">Intel XE#1424</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/599">Intel XE#599</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_flip@2x-blocking-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +67 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-8/igt@kms_plan=
e@plane-position-covered.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_plane@plane-posi=
tion-covered.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-8/igt@kms_plan=
e@plane-position-covered@pipe-b-plane-2.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_p=
lane@plane-position-covered@pipe-b-plane-2.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-c-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-1/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1437">Intel XE#1437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">=
Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_evict@evict-beng-cm-thread=
s-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_oa@unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2248">Intel XE#2248</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-3/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137533v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/s=
hard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-4/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-3/igt@kms_vbla=
nk@wait-busy.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137533v1/shard-bmg-8/igt@kms_vblank@wait-busy.html">PASS=
</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-bmg-3/igt@kms_vbla=
nk@wait-busy@pipe-d-hdmi-a-3.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-bmg-8/igt@kms_vblank=
@wait-busy@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-4/igt@xe_ccs@c=
trl-surf-copy-new-ctx.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-2/igt@xe_ccs@ctrl-surf-copy-=
new-ctx.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-90.html">ABORT</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137533v1/shard-lnl-6/igt@kms_big_fb@yf-ti=
led-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7979 -&gt; IGT_7980</li>
<li>Linux: xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b -&gt; xe-pw-137=
533v1</li>
</ul>
<p>IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0=
feb238bedde6a9d3b<br />
  xe-pw-137533v1: 137533v1</p>

</body>
</html>

--===============1755334990019682546==--
