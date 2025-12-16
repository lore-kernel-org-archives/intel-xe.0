Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489EBD5C0C1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 02:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07FB10E5D8;
	Tue, 16 Dec 2025 02:19:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89A10E08A;
 Tue, 16 Dec 2025 02:19:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0457229740448739484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_All_pa?=
 =?utf-8?q?tches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 02:19:38 -0000
Message-ID: <176585157889.91286.14161058941941705939@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215154740.1738648-18-dev@lankhorst.se>
In-Reply-To: <20251215154740.1738648-18-dev@lankhorst.se>
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

--===============0457229740448739484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe.
URL   : https://patchwork.freedesktop.org/series/159034/
State : failure

== Summary ==

CI Bug Log - changes from xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32_FULL -> xe-pw-159034v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159034v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159034v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159034v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] +12 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@xe_exec_system_allocator@prefetch-benchmark:
    - shard-bmg:          NOTRUN -> [TIMEOUT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@prefetch-benchmark.html

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - shard-bmg:          [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([SKIP][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [ABORT][25], [ABORT][26], [ABORT][27], [ABORT][28], [PASS][29], [ABORT][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38]) ([Intel XE#2457]) -> ([PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [ABORT][45], [ABORT][46], [TIMEOUT][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-6/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-6/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-6/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-159034v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2233])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3718] / [Intel XE#6078])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#6078]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2327]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1124]) +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#607])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#610])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#367]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3432])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2887]) +15 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2724])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2325]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2252]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6507])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][76] ([Intel XE#1178]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2341])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2320]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2321]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#5354])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4354])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2244]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4422]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#776])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#3321]) +10 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#301]) +3 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2380]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2311]) +31 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4141]) +16 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +29 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2393])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5020])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#870])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2499])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1406] / [Intel XE#2387])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2413])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1435])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6503]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2509])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2450])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2168])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1499]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6599])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4837]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4837] / [Intel XE#6665]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2322]) +12 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6874]) +32 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#5007])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][122] -> [WARN][123] ([Intel XE#5786])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4943]) +26 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2457])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#6332]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_oa@non-zero-reason-all.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2245])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#5742])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-lnl:          [PASS][130] -> [INCOMPLETE][131] ([Intel XE#4504]) +5 other tests incomplete
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#6251]) +6 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#4733]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#944]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#5354]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race:
    - shard-bmg:          [SKIP][138] ([Intel XE#6703]) -> [PASS][139] +21 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - shard-bmg:          [SKIP][140] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-race:
    - shard-bmg:          [ABORT][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-new-race.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-new-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [FAIL][144] ([Intel XE#6558]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [SKIP][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171]) ([Intel XE#378]) -> ([PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [FAIL][195] ([Intel XE#6676]) -> [FAIL][196] ([Intel XE#3718] / [Intel XE#6676])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][197] ([Intel XE#6703]) -> [SKIP][198] ([Intel XE#1124])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][199] ([Intel XE#5545]) -> [FAIL][200] ([Intel XE#3321]) +1 other test fail
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#2311])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2313])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#870])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#6503])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_sharpness_filter@filter-scaler-upscale.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][209] ([Intel XE#1729]) -> [SKIP][210] ([Intel XE#2426])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#6874])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#5007])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#4943]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          [FAIL][217] ([Intel XE#6558]) -> [SKIP][218] ([Intel XE#2229])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6332
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6558
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32 -> xe-pw-159034v1

  IGT_8666: 8666
  xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32: 041460d53aa3554e4f2d8fb81269e2653200da32
  xe-pw-159034v1: 159034v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/index.html

--===============0457229740448739484==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMP=
T_RT work on i915 + xe.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159034v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159034v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4246-041460d53aa3554e4f2d8fb81269e2653=
200da32_FULL -&gt; xe-pw-159034v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159034v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159034v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1590=
34v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-c-edp-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_=
cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.h=
tml">INCOMPLETE</a> +12 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_hdr@=
bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend=
.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-benchmark:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_exec_system_allocator@pref=
etch-benchmark.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-sys-benchmark:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_exec_=
system_allocator@prefetch-sys-benchmark.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_ex=
ec_system_allocator@prefetch-sys-benchmark.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_pm@s4-mocs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200=
da32/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e265=
3200da32/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269=
e2653200da32/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb8=
1269e2653200da32/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d=
8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554=
e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html">ABORT</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53a=
a3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.html">AB=
ORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-04146=
0d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load@load.htm=
l">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-=
041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-6/igt@xe_module_load=
@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/s=
hard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da=
32/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159034v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-6/igt@xe_module_load@load.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159034v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-6/igt@xe_=
module_load@load.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/s=
hard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159034v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159034v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel =
XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shar=
d-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_curs=
or_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_cur=
sor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_=
flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-=
filter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_compute@eu-busy-10s.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +32 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_system_allocator@many=
-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-3/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_exec_system_allocator@proc=
ess-many-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +26 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_oa@no=
n-zero-reason-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_oa@non-zero-reason-all.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6332">Intel XE#6332</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_pm@s2=
idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-use=
rptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4504">Intel XE#4504</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_pmu@engine-acti=
vity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6251">Intel XE#6251</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-8/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">In=
tel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159034v1/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-tra=
nsitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_=
system_allocator@many-execqueues-mmap-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shar=
d-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html">PASS</=
a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_=
system_allocator@many-malloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v1/shard-bmg-8/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-execqueues-new-race.html">ABORT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-=
5/igt@xe_exec_system_allocator@threads-many-execqueues-new-race.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6558">Intel XE#6558</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@xe_live_ktest@xe_bo=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200=
da32/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e265=
3200da32/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269=
e2653200da32/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb8=
1269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d=
8fb81269e2653200da32/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e=
4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3=
554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-041460d5=
3aa3554e4f2d8fb81269e2653200da32/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-0414=
60d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4246-=
041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-1/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da3=
2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159034v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159034v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159034v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159034v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-lnl-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-lnl-5/i=
gt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676">Intel =
XE#6676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1=
/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321=
">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159034v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@kms_p=
m_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_shar=
pness_filter@filter-scaler-upscale.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/=
igt@kms_sharpness_filter@filter-scaler-upscale.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_=
multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v1/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-s=
mem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_=
system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8=
/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_exec_=
system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-=
bmg-8/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel =
XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32/shard-bmg-2/igt@xe_live_=
ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6558">Intel XE#6558</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1/shard-bmg-8/ig=
t@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32 -&gt; xe-pw-159=
034v1</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4246-041460d53aa3554e4f2d8fb81269e2653200da32: 041460d53aa3554e4f2d8fb=
81269e2653200da32<br />
  xe-pw-159034v1: 159034v1</p>

</body>
</html>

--===============0457229740448739484==--
