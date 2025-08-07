Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F225C87FD3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 00:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B1110E06F;
	Thu,  7 Aug 2025 00:57:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9204F10E06F;
 Thu,  7 Aug 2025 00:57:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3996094568937337441=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_TLB_invalidation_abstr?=
 =?utf-8?q?action_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 00:57:46 -0000
Message-ID: <175452826656.218004.478136824484258170@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806222404.30333-1-stuart.summers@intel.com>
In-Reply-To: <20250806222404.30333-1-stuart.summers@intel.com>
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

--===============3996094568937337441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add TLB invalidation abstraction (rev3)
URL   : https://patchwork.freedesktop.org/series/152022/
State : failure

== Summary ==

CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL -> xe-pw-152022v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152022v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152022v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152022v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr:
    - shard-adlp:         [PASS][6] -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] +4 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - shard-adlp:         [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
    - shard-lnl:          [PASS][14] -> [ABORT][15] +1 other test abort
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-lnl:          [PASS][16] -> [DMESG-WARN][17] +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:
    - shard-lnl:          [SKIP][18] ([Intel XE#4943]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [ABORT][20] ([Intel XE#4757]) -> [INCOMPLETE][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-bmg:          [ABORT][22] ([Intel XE#5530]) -> [INCOMPLETE][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
Known issues
------------

  Here are the changes found in xe-pw-152022v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2134])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@fbdev@info.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@fbdev@nullptr.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#4912]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#4912]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +4 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-9/igt@kms_async_flips@invalid-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +97 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#2705] / [Intel XE#4212])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#4633])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#3226])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#3226])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4494])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2244])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#301]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][55] -> [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][61] -> [DMESG-FAIL][62] ([Intel XE#4543]) +1 other test dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4208]) +144 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#455])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#4208] / [i915#2575]) +119 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#616]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-434/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4208] / [i915#2575]) +22 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1499])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_vrr@negative-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-lnl:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2594])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#1392]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][80] -> [DMESG-WARN][81] ([Intel XE#3876])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-adlp:         [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#3876]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#4208]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][87] ([Intel XE#1173])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#4208]) +220 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#569])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][92] -> [DMESG-FAIL][93] ([Intel XE#5545])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_pm@s3-multiple-execs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#4543]) -> [PASS][95] +2 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_async_flips@crc.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_async_flips@crc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][96] ([Intel XE#2291]) -> [PASS][97] +5 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][98] ([Intel XE#4302]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][100] ([Intel XE#2316]) -> [PASS][101] +4 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][102] ([Intel XE#301]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][104] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][106] ([Intel XE#4543]) -> [PASS][107] +2 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][108] ([Intel XE#1503]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][110] ([Intel XE#3012]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][112] ([Intel XE#4596]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-adlp:         [DMESG-WARN][114] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][115] +5 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][116] ([Intel XE#1435]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][118] ([Intel XE#4227]) -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_vrr@flipline.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1392]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#623]) -> [SKIP][123] ([Intel XE#4208] / [i915#2575])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#316]) -> [SKIP][125] ([Intel XE#4208]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#316]) -> [SKIP][127] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1124]) -> [SKIP][129] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1124]) -> [SKIP][131] ([Intel XE#4208]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#367]) -> [SKIP][133] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#2907]) -> [SKIP][135] ([Intel XE#4208]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][137] ([Intel XE#4208]) +10 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][139] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][140] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [SKIP][141] ([Intel XE#2351] / [Intel XE#4208])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#306]) -> [SKIP][143] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#373]) -> [SKIP][145] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#307]) -> [SKIP][147] ([Intel XE#4208] / [i915#2575])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][148] ([Intel XE#1178]) -> [SKIP][149] ([Intel XE#2341])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_content_protection@legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][150] ([Intel XE#1178]) -> [SKIP][151] ([Intel XE#4208] / [i915#2575])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_content_protection@legacy.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][152] ([Intel XE#2341]) -> [FAIL][153] ([Intel XE#1178])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_content_protection@srm.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#308]) -> [SKIP][155] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#4331]) -> [SKIP][157] ([Intel XE#4208])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#455]) -> [SKIP][159] ([Intel XE#4208]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#4543]) -> [DMESG-WARN][161] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#455]) -> [SKIP][163] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#2312]) -> [SKIP][165] ([Intel XE#2311]) +15 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][166] ([Intel XE#2311]) -> [SKIP][167] ([Intel XE#2312]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][168] ([Intel XE#5390]) -> [SKIP][169] ([Intel XE#2312])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#5390]) +10 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#651]) -> [SKIP][173] ([Intel XE#4208]) +25 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#651]) -> [SKIP][175] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#2312]) -> [SKIP][177] ([Intel XE#2313]) +16 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1158]) -> [SKIP][179] ([Intel XE#4208])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#653]) -> [SKIP][183] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#653]) -> [SKIP][185] ([Intel XE#4208]) +33 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][186] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][187] ([Intel XE#3544])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#346]) -> [SKIP][189] ([Intel XE#4208])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#4298]) -> [SKIP][191] ([Intel XE#4208])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#870]) -> [SKIP][193] ([Intel XE#4208]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1122]) -> [SKIP][195] ([Intel XE#2351] / [Intel XE#4208])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1129]) -> [SKIP][197] ([Intel XE#4208])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][198] ([Intel XE#3325]) -> [SKIP][199] ([Intel XE#734])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1489]) -> [SKIP][201] ([Intel XE#4208]) +8 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1122]) -> [SKIP][203] ([Intel XE#4208])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][205] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][207] ([Intel XE#4208]) +12 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1127]) -> [SKIP][209] ([Intel XE#4208] / [i915#2575])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#3414]) -> [SKIP][211] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#455]) -> [SKIP][213] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_vrr@flipline.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][215] ([Intel XE#4208]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#5249]) -> [SKIP][217] ([Intel XE#4208])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_configfs@survivability-mode.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#5626]) -> [SKIP][219] ([Intel XE#4208]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#4837]) -> [SKIP][221] ([Intel XE#4208]) +17 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1392]) -> [SKIP][223] ([Intel XE#4208]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#288]) -> [SKIP][225] ([Intel XE#4208]) +32 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4915]) -> [SKIP][227] ([Intel XE#4208]) +309 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][228] ([Intel XE#5530]) -> [ABORT][229] ([Intel XE#4917] / [Intel XE#5530])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][230] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [INCOMPLETE][231] ([Intel XE#5466])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][232] -> [INCOMPLETE][233] ([Intel XE#5531])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#5103]) -> [SKIP][235] ([Intel XE#4208])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#3573]) -> [SKIP][237] ([Intel XE#4208]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][238] ([Intel XE#1173]) -> [SKIP][239] ([Intel XE#1061] / [Intel XE#4208])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_peer2peer@read.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1061]) -> [FAIL][241] ([Intel XE#1173])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_peer2peer@write.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][243] ([Intel XE#4208])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#4650]) -> [SKIP][245] ([Intel XE#4208])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4733]) -> [SKIP][247] ([Intel XE#4208]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#944]) -> [SKIP][249] ([Intel XE#4208]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#4814]) -> [SKIP][251] ([Intel XE#4208]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#4130]) -> [SKIP][253] ([Intel XE#4208])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#5762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5762
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -> xe-pw-152022v3

  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8
  xe-pw-152022v3: 152022v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/index.html

--===============3996094568937337441==
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
<tr><td><b>Series:</b></td><td>Add TLB invalidation abstraction (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152022/">https://patchwork.freedesktop.org/series/152022/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL -&gt; xe-pw-152022v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152022v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152022v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152022v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">INCOMPLETE</a> +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">DMESG-WARN</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152022v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-9/igt@kms_async_flips@invalid-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-6/igt@kms_async_flips@invalid-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-3/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_async_flips@crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-lnl-8/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +309 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531">Intel XE#5531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -&gt; xe-pw-152022v3</li>
</ul>
<p>IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8<br />
  xe-pw-152022v3: 152022v3</p>

</body>
</html>

--===============3996094568937337441==--
