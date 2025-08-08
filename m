Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44924C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 12:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85FC10E1D5;
	Fri,  8 Aug 2025 12:46:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC9610E021;
 Fri,  8 Aug 2025 12:46:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7369479089006422319=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_ANDROID=3A_Add_GPU_work_pe?=
 =?utf-8?q?riod_support_for_Xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 12:46:50 -0000
Message-ID: <175465721063.222630.17265671443216666964@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
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

--===============7369479089006422319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ANDROID: Add GPU work period support for Xe driver
URL   : https://patchwork.freedesktop.org/series/152678/
State : failure

== Summary ==

CI Bug Log - changes from xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba_FULL -> xe-pw-152678v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152678v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152678v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152678v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@legacy-planes@plane-73:
    - shard-adlp:         NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-73.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset:
    - shard-lnl:          [PASS][2] -> [ABORT][3] +4 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-bmg:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-8/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - shard-adlp:         [PASS][6] -> [ABORT][7] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-rebind.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9] +2 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-464/igt@xe_module_load@reload.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-433/igt@xe_module_load@reload.html
    - shard-lnl:          [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_module_load@reload.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@reload.html
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-5/igt@xe_module_load@reload.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-2/igt@xe_module_load@reload.html
    - shard-adlp:         [PASS][14] -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-4/igt@xe_module_load@reload.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-9/igt@xe_module_load@reload.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@xe_pm@d3hot-mmap-vram.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@xe_pm@d3hot-mmap-vram.html
    - shard-dg2-set2:     [PASS][18] -> [FAIL][19] +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@xe_pm@d3hot-mmap-vram.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@d3hot-mocs:
    - shard-adlp:         [PASS][20] -> [FAIL][21] +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@xe_pm@d3hot-mocs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@xe_pm@d3hot-mocs.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][22] ([Intel XE#5390]) -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  
New tests
---------

  New tests have been introduced between xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba_FULL and xe-pw-152678v1_FULL:

### New IGT tests (1) ###

  * igt@kms_flip_scaled_crc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-152678v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1407])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#316])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][27] ([Intel XE#4543]) +1 other test dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#4543])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +90 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#3862]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +17 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2669]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][39] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2252])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#307])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2320])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#308])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#309])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#4633])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#4354])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#4422])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#776])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1137])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#310]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
    - shard-dg2-set2:     [PASS][64] -> [INCOMPLETE][65] ([Intel XE#2049] / [Intel XE#2597])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#4543]) +4 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#651]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#653]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1503])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#346])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#356])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-adlp:         [PASS][81] -> [DMESG-WARN][82] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_plane_scaling@invalid-num-scalers.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#870])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1129])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1489]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4609])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#2939] / [Intel XE#5585])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#3414])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#455]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_vrr@flip-suspend.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#5626])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#4837] / [Intel XE#5565]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4837]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4837])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1392])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#1392]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#288]) +11 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4943])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@xe_exec_system_allocator@many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4915]) +60 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +80 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4943]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html

  * igt@xe_exec_threads@threads-fd-userptr-rebind:
    - shard-adlp:         [PASS][110] -> [INCOMPLETE][111] ([Intel XE#3868])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-8/igt@xe_exec_threads@threads-fd-userptr-rebind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-3/igt@xe_exec_threads@threads-fd-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#5100])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@many-reload:
    - shard-lnl:          [PASS][113] -> [ABORT][114] ([Intel XE#5087])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@many-reload.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#3573]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3573]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1061])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2284] / [Intel XE#366])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [PASS][119] -> [FAIL][120] ([Intel XE#2142])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@xe_pm@d3hot-mocs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@xe_pm@d3hot-mocs.html
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#2142])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_pm@d3hot-mocs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4733])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#944]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4814])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4130])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4130])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][128] ([Intel XE#2291]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][130] ([Intel XE#2316]) -> [PASS][131] +6 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#4543]) -> [PASS][133] +5 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][134] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][136] ([Intel XE#1503]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@kms_hdr@static-toggle.html
    - shard-dg2-set2:     [INCOMPLETE][138] -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@kms_hdr@static-toggle.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_hdr@static-toggle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][140] ([Intel XE#1435]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1392]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][144], [PASS][145], [PASS][146], [SKIP][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169]) ([Intel XE#378]) -> ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-5/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-5/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][195] ([Intel XE#2341]) -> [FAIL][196] ([Intel XE#1178])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#4543]) -> [DMESG-WARN][198] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][199] ([Intel XE#4760]) -> [SKIP][200] ([Intel XE#1397] / [Intel XE#1745])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][201] ([Intel XE#4760]) -> [SKIP][202] ([Intel XE#1397])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][203] ([Intel XE#2311]) -> [SKIP][204] ([Intel XE#2312]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [SKIP][206] ([Intel XE#2311]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][207] ([Intel XE#2312]) -> [SKIP][208] ([Intel XE#5390]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#5390]) -> [SKIP][210] ([Intel XE#2312]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#2313]) -> [SKIP][212] ([Intel XE#2312]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#2313]) +13 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba -> xe-pw-152678v1

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba: 0a8f74a5dde6c5327dac9522cf1441003f2ebcba
  xe-pw-152678v1: 152678v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/index.html

--===============7369479089006422319==
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
<tr><td><b>Series:</b></td><td>ANDROID: Add GPU work period support for Xe =
driver</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152678/">https://patchwork.freedesktop.org/series/152678/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152678v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152678v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3517-0a8f74a5dde6c5327dac9522cf1441003=
f2ebcba_FULL -&gt; xe-pw-152678v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152678v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152678v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1526=
78v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-73:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@pla=
ne-73.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-mlo=
ck-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-file-mlock-nomemset.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152678v1/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-exec=
queues-mmap-file-mlock-nomemset.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-8/igt@xe_exec_=
threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@xe_e=
xec_threads@threads-cm-fd-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-6/igt@xe_exec=
_threads@threads-mixed-fd-rebind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-2/igt@xe_exec_thr=
eads@threads-mixed-fd-rebind.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-464/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-433/igt@xe_module_load@reload.html"=
>ABORT</a> +2 other tests abort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@reload.html">INC=
OMPLETE</a> +1 other test incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-5/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152678v1/shard-bmg-2/igt@xe_module_load@reload.html">INC=
OMPLETE</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-4/igt@xe_modu=
le_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152678v1/shard-adlp-9/igt@xe_module_load@reload.html">I=
NCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@xe_pm@d3=
hot-mmap-vram.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@xe_pm@d3hot-mmap-vram.html">FAI=
L</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@xe_pm@=
d3hot-mmap-vram.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_pm@d3hot-mmap-vram.html"=
>FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@xe_pm@d=
3hot-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152678v1/shard-adlp-6/igt@xe_pm@d3hot-mocs.html">FAIL</a> +1=
 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-=
bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">ABORT</a><=
/li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3517-0a8f74a5dde6c5327dac9522c=
f1441003f2ebcba_FULL and xe-pw-152678v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip_scaled_crc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152678v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 othe=
r test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/s=
hard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-2/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-=
movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_flip@2x=
-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152678v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@km=
s_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-=
dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32=
bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152678v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_pla=
ne_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6/igt@kms_plane_sca=
ling@invalid-num-scalers.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_psr@fbc-pr-no-drrs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_eudebug_online@breakpoint=
-many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommi=
t-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-basic.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@xe_exec_basic@m=
ultigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@xe_exec_system_allocator@many=
-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_exec_system_allocator@onc=
e-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +60 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +80 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-8/igt@xe_exec=
_threads@threads-fd-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-3/igt@xe_exec_t=
hreads@threads-fd-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-o=
bject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@many-reload=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-adlp-1/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@xe_pm@d3=
hot-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152678v1/shard-bmg-8/igt@xe_pm@d3hot-mocs.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#=
2142</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_pm@d3=
hot-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_pm@d3hot-mocs.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#=
2142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-464/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-b=
mg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-6/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-2=
/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> +5 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-5/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@kms_hd=
r@static-toggle.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2-432/igt@kms_hdr@static-toggle=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bm=
g-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-dg2=
-435/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2e=
bcba/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf144100=
3f2ebcba/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf14=
41003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522=
cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac=
9522cf1441003f2ebcba/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c532=
7dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6=
c5327dac9522cf1441003f2ebcba/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5=
dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f=
74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3517-=
0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcb=
a/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152678v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152678v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-152678v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-bmg-8/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152678v1/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE=
#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152678v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xti=
le-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4760">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152678v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
78v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
78v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
78v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
78v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52678v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
678v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba -&gt; xe-pw-152=
678v1</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3517-0a8f74a5dde6c5327dac9522cf1441003f2ebcba: 0a8f74a5dde6c5327dac952=
2cf1441003f2ebcba<br />
  xe-pw-152678v1: 152678v1</p>

</body>
</html>

--===============7369479089006422319==--
