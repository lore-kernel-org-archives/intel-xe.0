Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384EBCA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 09:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA710E3B1;
	Mon, 11 Aug 2025 09:13:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC60210E3B1;
 Mon, 11 Aug 2025 09:13:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5810212743305804084=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Consolidate_VM_i?=
 =?utf-8?q?nitialization_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Aug 2025 09:13:06 -0000
Message-ID: <175490358682.225896.9288001372567052541@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
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

--===============5810212743305804084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Consolidate VM initialization logic
URL   : https://patchwork.freedesktop.org/series/152748/
State : failure

== Summary ==

CI Bug Log - changes from xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b_FULL -> xe-pw-152748v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152748v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152748v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152748v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +27 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +11 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +12 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a6.html

  * igt@kms_psr@psr-sprite-blt@edp-1:
    - shard-lnl:          [PASS][9] -> [ABORT][10] +22 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@kms_psr@psr-sprite-blt@edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@kms_psr@psr-sprite-blt@edp-1.html

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:
    - shard-bmg:          [PASS][19] -> [ABORT][20] +21 other tests abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race.html

  * igt@xe_pat@pat-index-xelp@blt:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_pat@pat-index-xelp@blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pat@pat-index-xelp@blt.html

  * igt@xe_pat@pat-index-xelp@dw:
    - shard-adlp:         [PASS][23] -> [ABORT][24] +14 other tests abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_pat@pat-index-xelp@dw.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pat@pat-index-xelp@dw.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#316]) -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-adlp:         [SKIP][27] ([Intel XE#316]) -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][29] ([Intel XE#367]) -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#367]) -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [DMESG-FAIL][33] ([Intel XE#4543]) -> [ABORT][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - shard-lnl:          [SKIP][35] ([Intel XE#4943]) -> [ABORT][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html
    - shard-bmg:          [SKIP][37] ([Intel XE#4943]) -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][39] ([Intel XE#1948]) -> [ABORT][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset}:
    - shard-bmg:          [PASS][41] -> [ABORT][42] +2 other tests abort
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset.html

  * {igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race}:
    - shard-lnl:          [PASS][43] -> [ABORT][44] +2 other tests abort
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-152748v1_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [SKIP][70]) ([Intel XE#378]) -> ([PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-8/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-7/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][96], [PASS][97], [SKIP][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121]) ([Intel XE#2457]) -> ([PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-6/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-6/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-6/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-2/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-5/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-5/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [SKIP][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223]) ([Intel XE#378]) -> ([PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-466/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-464/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-464/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-436/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-436/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-436/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-466/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-466/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-464/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-434/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-466/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-434/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-466/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-466/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-432/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-432/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-434/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-435/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-435/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-435/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612


Build changes
-------------

  * Linux: xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b -> xe-pw-152748v1

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b: 0a2be3731268a69a6452047c2fb6699ee19afe5b
  xe-pw-152748v1: 152748v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/index.html

--===============5810212743305804084==
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
<tr><td><b>Series:</b></td><td>drm/xe: Consolidate VM initialization logic<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152748/">https://patchwork.freedesktop.org/series/152748/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152748v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3522-0a2be3731268a69a6452047c2fb6699ee=
19afe5b_FULL -&gt; xe-pw-152748v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152748v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152748v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1527=
48v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2=
-436/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">AB=
ORT</a> +27 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@kms_flip=
@dpms-vs-vblank-race-interruptible@c-edp1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@kms=
_flip@dpms-vs-vblank-race-interruptible@c-edp1.html">DMESG-WARN</a> +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-5/igt@kms_flip=
@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/ig=
t@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html">DMESG-WARN</a>=
 +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@kms_fl=
ip@dpms-vs-vblank-race-interruptible@d-hdmi-a6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/=
igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a6.html">DMESG-WARN</=
a> +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@kms_psr@=
psr-sprite-blt@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-1/igt@kms_psr@psr-sprite-blt@e=
dp-1.html">ABORT</a> +22 other tests abort</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/sha=
rd-adlp-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15274=
8v1/shard-adlp-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152748v1/shard-adlp-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152748v1/shard-adlp-3/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-new-race.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-race.html=
">ABORT</a> +21 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_pat@=
pat-index-xelp@blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pat@pat-index-xelp@blt=
.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@dw:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_pat@=
pat-index-xelp@dw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pat@pat-index-xelp@dw.h=
tml">ABORT</a> +14 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">ABORT</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@kms_big=
_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@kms_=
big_fb@x-tiled-8bpp-rotate-270.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-6/igt@kms_bw@l=
inear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/ig=
t@kms_bw@linear-tiling-2-displays-1920x1080p.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@kms_bw=
@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-46=
3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1=
/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">AB=
ORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-many-large-mmap-huge.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/s=
hard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html">=
ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-large-mmap-huge.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/s=
hard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html">=
ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_pm@d3hot-mma=
p-vram.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-malloc-busy-nomemset}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_exec_=
system_allocator@many-64k-malloc-busy-nomemset.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/ig=
t@xe_exec_system_allocator@many-64k-malloc-busy-nomemset.html">ABORT</a> +2=
 other tests abort</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-race=
}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-5/igt@xe_exec_=
system_allocator@many-large-execqueues-malloc-prefetch-race.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/s=
hard-lnl-1/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefet=
ch-race.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152748v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19a=
fe5b/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699e=
e19afe5b/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6=
699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c=
2fb6699ee19afe5b/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452=
047c2fb6699ee19afe5b/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a=
6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268=
a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be373=
1268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2b=
e3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-=
0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5=
b/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
748v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152748v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
748v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
748v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
748v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152748v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
748v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152748v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19a=
fe5b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699e=
e19afe5b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6=
699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c=
2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452=
047c2fb6699ee19afe5b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a=
6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268=
a69a6452047c2fb6699ee19afe5b/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be373=
1268a69a6452047c2fb6699ee19afe5b/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2b=
e3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-=
0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5=
b/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152748v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5=
b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee1=
9afe5b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb66=
99ee19afe5b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c=
2fb6699ee19afe5b/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a645=
2047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a6=
9a6452047c2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731=
268a69a6452047c2fb6699ee19afe5b/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2b=
e3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522=
-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/sha=
rd-adlp-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5=
b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee1=
9afe5b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb66=
99ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c=
2fb6699ee19afe5b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a645=
2047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a6=
9a6452047c2fb6699ee19afe5b/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v=
1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152748v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2748v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152748v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard=
-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-6/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152748v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-9/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152748v1/shard-adlp-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/=
shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152748v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1527=
48v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-152748v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-adlp-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152748v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee1=
9afe5b/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6=
699ee19afe5b/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a64520=
47c2fb6699ee19afe5b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69=
a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731=
268a69a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2=
be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-35=
22-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19a=
fe5b/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb669=
9ee19afe5b/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c=
2fb6699ee19afe5b/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a64=
52047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268=
a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3=
731268a69a6452047c2fb6699ee19afe5b/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-=
0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152748v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2748v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152748v1/shard-dg2-463/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-466/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152748v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52748v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-435/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152748v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152748v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152748v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/=
shard-dg2-435/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b -&gt; xe-pw-152=
748v1</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b: 0a2be3731268a69a6452047=
c2fb6699ee19afe5b<br />
  xe-pw-152748v1: 152748v1</p>

</body>
</html>

--===============5810212743305804084==--
