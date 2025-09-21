Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA5CAC59A
	for <intel-xe@archiver.kernel.org>; Sun, 21 Sep 2025 06:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17E10E072;
	Sun, 21 Sep 2025 06:48:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3059B10E33E;
 Sun, 21 Sep 2025 06:47:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7100815474649160454=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_set=5Fcontext=5F?=
 =?utf-8?q?latency_and_refactor_VRR/DSB_timing_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 21 Sep 2025 06:47:59 -0000
Message-ID: <175843727918.351355.9048584850710230550@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250921043535.2012978-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250921043535.2012978-1-ankit.k.nautiyal@intel.com>
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

--===============7100815474649160454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce set_context_latency and refactor VRR/DSB timing logic
URL   : https://patchwork.freedesktop.org/series/154809/
State : failure

== Summary ==

CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_FULL -> xe-pw-154809v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154809v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154809v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154809v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-3-4:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +160 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-3-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-3-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-6-4:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +84 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-6-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-6-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][5] -> [FAIL][6] +231 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][7] -> [DMESG-FAIL][8] +39 other tests dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][9] +3 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][10] +17 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] +31 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][12] -> [FAIL][13] +336 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][14] -> [FAIL][15] +215 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_flip@plain-flip-ts-check@b-hdmi-a6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_flip@plain-flip-ts-check@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-FAIL][17] +6 other tests dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          NOTRUN -> [FAIL][18] +43 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] +8 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          NOTRUN -> [ABORT][21]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
#### Warnings ####

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][22] ([Intel XE#2316]) -> [DMESG-WARN][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][24] ([Intel XE#2316]) -> [DMESG-FAIL][25] +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][26] ([Intel XE#4543] / [Intel XE#5208]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][28] ([Intel XE#4543]) -> [FAIL][29] +24 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][30] ([Intel XE#2953] / [Intel XE#4173]) -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][32] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         [FAIL][34] ([Intel XE#5195]) -> [FAIL][35] +4 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [SKIP][58], [PASS][59], [PASS][60], [PASS][61]) ([Intel XE#378]) -> ([DMESG-WARN][62], [DMESG-WARN][63], [DMESG-WARN][64], [DMESG-WARN][65], [DMESG-WARN][66], [DMESG-WARN][67], [DMESG-WARN][68], [DMESG-WARN][69], [DMESG-WARN][70], [DMESG-WARN][71], [DMESG-WARN][72], [DMESG-WARN][73], [DMESG-WARN][74], [DMESG-WARN][75], [DMESG-WARN][76], [DMESG-WARN][77], [DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-2/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-4/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-2/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-2/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-2/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rgb565}:
    - shard-bmg:          [PASS][87] -> [DMESG-WARN][88] +1 other test dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rgb565.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rgb565.html

  * {igt@xe_exec_system_allocator@process-many-malloc-prefetch-race}:
    - shard-bmg:          NOTRUN -> [FAIL][89] +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-prefetch-race.html

  * {igt@xe_exec_system_allocator@twice-new-prefetch}:
    - shard-bmg:          [PASS][90] -> [CRASH][91] +6 other tests crash
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@xe_exec_system_allocator@twice-new-prefetch.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-new-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-154809v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#5667])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [PASS][94] -> [FAIL][95] ([Intel XE#1231]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [PASS][96] -> [DMESG-WARN][97] ([Intel XE#4543]) +19 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1124])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#367])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#787]) +76 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][104] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#4543])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][105] -> [INCOMPLETE][106] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#4543])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#373])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2252]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2390])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#1178])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][111] ([Intel XE#4626])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][112] -> [FAIL][113] ([Intel XE#616]) +55 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#616]) +2 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2320])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#2291]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#5394]) +3 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][120] -> [INCOMPLETE][121] ([Intel XE#3226])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][122] -> [INCOMPLETE][123] ([Intel XE#3226]) +4 other tests incomplete
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][124] -> [INCOMPLETE][125] ([Intel XE#3226] / [Intel XE#4543]) +2 other tests incomplete
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-adlp:         [PASS][126] -> [FAIL][127] ([Intel XE#1475]) +4 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][128] -> [FAIL][129] ([Intel XE#5299])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][130] -> [FAIL][131] ([Intel XE#1475]) +3 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#5428])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][133] -> [SKIP][134] ([Intel XE#1340])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-FAIL][136] ([Intel XE#4543]) +115 other tests dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][137] ([Intel XE#4543]) +11 other tests dmesg-fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a2-dp2.html

  * igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][138] -> [DMESG-WARN][139] ([Intel XE#4543]) +415 other tests dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][140] -> [FAIL][141] ([Intel XE#3149]) +4 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#2316]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][144] ([Intel XE#4543]) +41 other tests dmesg-warn
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][145] -> [DMESG-FAIL][146] ([Intel XE#5208]) +1 other test dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][147] -> [DMESG-FAIL][148] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][149] -> [DMESG-WARN][150] ([Intel XE#5208]) +2 other tests dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         [PASS][151] -> [FAIL][152] ([Intel XE#3149])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][153] -> [DMESG-FAIL][154] ([Intel XE#4543]) +2 other tests dmesg-fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_flip@plain-flip-interruptible@d-hdmi-a1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_flip@plain-flip-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][155] -> [FAIL][156] ([Intel XE#3149]) +3 other tests fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-bmg:          [PASS][157] -> [FAIL][158] ([Intel XE#3106]) +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2293] / [Intel XE#2380])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2293])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][161] -> [FAIL][162] ([Intel XE#1874]) +12 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2311]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#5390])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2313]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#5672])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [PASS][167] -> [DMESG-WARN][168] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-dp-2:
    - shard-bmg:          [PASS][169] -> [DMESG-FAIL][170] ([Intel XE#4626]) +12 other tests dmesg-fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-dp-2.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-dp-2.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][171] -> [DMESG-WARN][172] ([Intel XE#4543] / [Intel XE#5681]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [PASS][173] -> [DMESG-WARN][174] ([Intel XE#5681]) +1 other test dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][175] -> [SKIP][176] ([Intel XE#4596])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-dg2-set2:     [PASS][177] -> [DMESG-WARN][178] ([Intel XE#4543] / [Intel XE#5175]) +1 other test dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_plane_multiple@tiling-none.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#870])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-dg2-set2:     [PASS][183] -> [FAIL][184] ([Intel XE#4689] / [Intel XE#616]) +1 other test fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [PASS][185] -> [FAIL][186] ([Intel XE#4689]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
    - shard-adlp:         [PASS][187] -> [FAIL][188] ([Intel XE#4689]) +1 other test fail
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][189] -> [FAIL][190] ([Intel XE#2883]) +2 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_setmode@basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_setmode@basic.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [FAIL][191] ([Intel XE#5890]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#4837])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][193] -> [SKIP][194] ([Intel XE#1392]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@xe_exec_basic@multigpu-once-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [PASS][195] -> [DMESG-FAIL][196] ([Intel XE#3876]) +4 other tests dmesg-fail
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@twice-userptr-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][197] ([Intel XE#3876]) +4 other tests dmesg-fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_basic@twice-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#288])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [FAIL][199] ([Intel XE#6050]) +2 other tests fail
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][200] -> [DMESG-WARN][201] ([Intel XE#3876])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          NOTRUN -> [FAIL][202] ([Intel XE#4937]) +19 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#4943]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#4915]) +20 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap:
    - shard-bmg:          [PASS][205] -> [FAIL][206] ([Intel XE#4937]) +3 other tests fail
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unmap.html

  * igt@xe_pmu@engine-activity-load:
    - shard-adlp:         [PASS][207] -> [TIMEOUT][208] ([Intel XE#3876]) +3 other tests timeout
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_pmu@engine-activity-load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_pmu@engine-activity-load.html
    - shard-bmg:          NOTRUN -> [TIMEOUT][209] ([Intel XE#3876]) +1 other test timeout
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pmu@engine-activity-load.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#944])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-8/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][211] ([Intel XE#4543]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][217] ([Intel XE#2291]) -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-dg2-set2:     [INCOMPLETE][219] ([Intel XE#3226]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#5354]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_cursor_legacy@single-bo.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][223] ([Intel XE#4302]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][225] ([Intel XE#4354]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [SKIP][227] ([Intel XE#2316]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][229] ([Intel XE#4543]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][231] ([Intel XE#1874]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_setmode@basic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][233] ([Intel XE#2883]) -> [PASS][234] +2 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_setmode@basic@pipe-a-dp-4.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-dp-4.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1392]) -> [PASS][236] +2 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * {igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch}:
    - shard-bmg:          [CRASH][237] -> [PASS][238] +6 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [FAIL][239] ([Intel XE#5507]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@xe_pat@pat-index-xe2.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@xe_pat@pat-index-xe2.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][241] ([Intel XE#4543]) -> [DMESG-WARN][242] ([Intel XE#4543]) +9 other tests dmesg-warn
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][243] ([Intel XE#4543]) -> [DMESG-FAIL][244] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][246] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522] / [Intel XE#4543])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][247] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][248] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522] / [Intel XE#4543])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][249] ([Intel XE#1178]) -> [DMESG-FAIL][250] ([Intel XE#4543]) +1 other test dmesg-fail
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][251] ([Intel XE#2341]) -> [FAIL][252] ([Intel XE#1178])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_content_protection@legacy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][253] ([Intel XE#1188]) -> [DMESG-FAIL][254] ([Intel XE#4543]) +1 other test dmesg-fail
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_content_protection@uevent.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][255] ([Intel XE#2291]) -> [INCOMPLETE][256] ([Intel XE#3226])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][257] ([Intel XE#2316]) -> [DMESG-WARN][258] ([Intel XE#5208])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [DMESG-WARN][259] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-FAIL][260] ([Intel XE#4543])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][261] ([Intel XE#4543]) -> [DMESG-FAIL][262] ([Intel XE#4543]) +5 other tests dmesg-fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][263] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][264] ([Intel XE#2953] / [Intel XE#4173])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-adlp:         [DMESG-WARN][265] ([Intel XE#4543]) -> [FAIL][266] ([Intel XE#3149])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [SKIP][268] ([Intel XE#2311]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2312]) +14 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#5390]) -> [SKIP][272] ([Intel XE#2312]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2312]) -> [SKIP][274] ([Intel XE#5390]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][275] ([Intel XE#2313]) -> [SKIP][276] ([Intel XE#2312]) +11 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([Intel XE#2313]) +16 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][279] ([Intel XE#2883]) -> [DMESG-WARN][280] ([Intel XE#4543]) +2 other tests dmesg-warn
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [ABORT][281] ([Intel XE#5466]) -> [ABORT][282] ([Intel XE#4917] / [Intel XE#5466])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         [SKIP][283] ([Intel XE#2284]) -> [TIMEOUT][284] ([Intel XE#3876])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_pm@d3cold-mocs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.html
    - shard-bmg:          [ABORT][285] ([Intel XE#4760]) -> [TIMEOUT][286] ([Intel XE#3876] / [Intel XE#6162])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pm@d3cold-mocs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5394
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5667
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -> xe-pw-154809v1

  IGT_8546: 8546
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142
  xe-pw-154809v1: 154809v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/index.html

--===============7100815474649160454==
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
<tr><td><b>Series:</b></td><td>Introduce set_context_latency and refactor V=
RR/DSB timing logic</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154809/">https://patchwork.freedesktop.org/series/154809/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154809v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154809v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac7=
3ff2142_FULL -&gt; xe-pw-154809v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154809v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154809v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1548=
09v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a=
-3-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-3-4.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15480=
9v1/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@=
pipe-c-hdmi-a-3-4.html">DMESG-WARN</a> +160 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a=
-6-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_as=
ync_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-6-4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
809v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-ti=
led@pipe-c-hdmi-a-6-4.html">DMESG-WARN</a> +84 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-offscreen-128x42.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-8/igt@kms_cursor_c=
rc@cursor-offscreen-128x42.html">FAIL</a> +231 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/=
igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">DMESG-FA=
IL</a> +39 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible@ad-dp2-hdmi-a3.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vbl=
ank@b-dp2.html">DMESG-WARN</a> +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-dp2.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">FAIL</a> +336 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_fl=
ip@plain-flip-ts-check@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_flip@p=
lain-flip-ts-check@b-hdmi-a6.html">FAIL</a> +215 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-154809v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-3=
2bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> +6 other tests=
 dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_plane_cursor@viewport@pip=
e-a-dp-2-size-64.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/s=
hard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers=
@pipe-a.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_flip=
@2x-absolute-wf_vblank.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-rmfb-interruptible.html">DMESG-FAIL</a> +1 other test=
 dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v=
1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adl=
p-1/igt@kms_flip@flip-vs-suspend-interruptible.html">FAIL</a> +24 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1=
/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_pla=
ne@pixel-format-source-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/=
shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html=
">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff=
2142/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac=
73ff2142/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc=
2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd5=
6dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007=
ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea=
4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8=
cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d8=
79d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa1=
28d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-=
cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-=
1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff214=
2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl=
-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-=
lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154809v1/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/sha=
rd-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-5/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154809v1/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/=
shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809=
v1/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-8/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-lnl-8/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
809v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154809v1/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-2/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-3=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-154809v1/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-=
2-4-rgb565}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_asyn=
c_flips@basic-modeset-with-all-modifiers-formats@pipe-a-dp-2-4-rgb565.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154809v1/shard-bmg-2/igt@kms_async_flips@basic-modeset-with-all-modifiers-f=
ormats@pipe-a-dp-2-4-rgb565.html">DMESG-WARN</a> +1 other test dmesg-warn</=
li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@process-many-malloc-prefetch-race}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-malloc-prefetch-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-new-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@xe_exec_=
system_allocator@twice-new-prefetch.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@xe_exec_s=
ystem_allocator@twice-new-prefetch.html">CRASH</a> +6 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154809v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_atom=
ic_transition@plane-all-transition-fencing.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@km=
s_atomic_transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5667">Intel XE#5=
667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/=
shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms=
_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-=
stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-256x256@pipe-d-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-466=
/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-6.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel X=
E#616</a>) +55 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rando=
m-128x128@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_cursor_le=
gacy@cursor-vs-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5394">Intel XE#5394</a>) +3 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434=
/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">=
Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/sh=
ard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3226">Intel XE#3226</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/=
shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-var=
ying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3226">Intel XE#3226</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_cursor_=
legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +4 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +3 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11=
5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend=
@bc-hdmi-a2-dp2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_fl=
ip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_fli=
p@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +415 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3149">Intel XE#3149</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-w=
f_vblank-interruptible@b-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +41 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154809v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5208">Intel XE#5208</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-6/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-5/igt@kms_flip=
@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_fli=
p@modeset-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) +=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_fli=
p@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-3/igt@kms_flip@plain-flip=
-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_fli=
p@plain-flip-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-1/igt@kms_fli=
p@plain-flip-interruptible@d-hdmi-a1.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 =
other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +3 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard=
-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3106">Intel XE#3106</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_pip=
e_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-2/igt@kms_pipe_crc_ba=
sic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_plan=
e_alpha_blend@alpha-7efc@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@kms_plan=
e_alpha_blend@alpha-7efc@pipe-d-dp-2.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) +12=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-463/igt@kms_pl=
ane_lowres@tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-436/igt@kms_plane_lowres@tiling=
-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5681">Intel XE#5681</a>) +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_plan=
e_lowres@tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5681">Intel XE#5681</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_pl=
ane_multiple@tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-463/igt@kms_plane_multiple=
@tiling-none.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) +1 other test=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@kms_psr@fbc-psr-primary-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_ro=
tation_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-434/igt@kms_=
rotation_crc@primary-x-tiled-reflect-x-0.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-1/igt@kms_ro=
tation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) +1 ot=
her test fail</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_rot=
ation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-2/igt@kms_=
rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154809v1/shard-bmg-6/igt@kms_setmode@basic.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@xe_exec_basic@=
multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_exec=
_basic@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/i=
gt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Int=
el XE#3876</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_basic@twice-userptr-r=
ebind.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3876">Intel XE#3876</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-bind=
execqueue-userptr-prefetch.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6050">Intel XE#6050</a>) +2 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eoch=
eck:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@many=
-large-mmap-shared-remap-dontunmap-eocheck.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>) +19=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +20 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-bo-unma=
p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-malloc-bo-unmap.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1=
/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mall=
oc-bo-unmap.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4937">Intel XE#4937</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_pmu@=
engine-activity-load.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_pmu@engine-activity-=
load.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3876">Intel XE#3876</a>) +3 other tests timeout</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pmu@engine-activity-load.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3876">Intel XE#3876</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154809v1/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154809v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154809v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-435/igt@kms_cu=
rsor_legacy@forked-bo@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-46=
6/igt@kms_cursor_legacy@forked-bo@pipe-b.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_curs=
or_legacy@single-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@kms_c=
ursor_legacy@single-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-5/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_flip@2x=
-flip-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154809v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
09v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_se=
tmode@basic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-464/igt@kms_s=
etmode@basic@pipe-a-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/s=
hard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-4/igt@xe_exec_=
system_allocator@many-large-execqueues-new-prefetch.html">CRASH</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bm=
g-7/igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch.html">P=
ASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@xe_pat@p=
at-index-xe2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-7/igt@xe_pat@pat-index-x=
e2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-3/i=
gt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +9 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
809v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154809v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-433/igt@=
kms_content_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 ot=
her test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-4/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-432/igt@kms_c=
ontent_protection@uevent.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test d=
mesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154809v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-2/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_fli=
p@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
09v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_fli=
p@flip-vs-panning-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1=
/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
09v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@kms_fli=
p@plain-flip-ts-check-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard=
-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3=
149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154809v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1548=
09v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154809v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54809v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_se=
tmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-dg2-464/igt@k=
ms_setmode@basic@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-466/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v=
1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-3/igt@xe_pm@d=
3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3876">Intel XE#3876</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-1/igt@xe_pm@d3=
cold-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154809v1/shard-bmg-3/igt@xe_pm@d3cold-mocs.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3876">Intel XE#3876</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6162">Intel XE#6162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -&gt; xe-pw-154=
809v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd=
56dcc2eac73ff2142<br />
  xe-pw-154809v1: 154809v1</p>

</body>
</html>

--===============7100815474649160454==--
