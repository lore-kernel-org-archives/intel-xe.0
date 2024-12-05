Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A83E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6710E39E;
	Thu,  5 Dec 2024 11:51:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98510E39E;
 Thu,  5 Dec 2024 11:51:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7680814054520684160=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_clean_?=
 =?utf-8?q?up_DP_Adaptive_Sync_SDP_state_mismatch_logging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 11:51:49 -0000
Message-ID: <173339950970.2954759.13957400658319413072@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205093042.3028608-1-jani.nikula@intel.com>
In-Reply-To: <20241205093042.3028608-1-jani.nikula@intel.com>
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

--===============7680814054520684160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
URL   : https://patchwork.freedesktop.org/series/142153/
State : failure

== Summary ==

CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760d899ae2_full -> xe-pw-142153v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142153v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142153v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142153v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][5] ([Intel XE#1231]) -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31]) ([Intel XE#3699]) -> ([FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-142153v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][57] -> [DMESG-FAIL][58] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][59] -> [DMESG-FAIL][60] ([Intel XE#1033] / [Intel XE#1727])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#3086]) +2 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#1430])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][67] -> [DMESG-WARN][68] ([Intel XE#2042])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-lnl:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#3184])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#3492]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][73] -> [ABORT][74] ([Intel XE#1358] / [Intel XE#1607])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@xe_pm@s4-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#3086]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][77] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][79] ([Intel XE#886]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][81] ([Intel XE#2029]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][83] ([Intel XE#2883]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][85] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@xe_module_load@many-reload.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-9/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][87] ([Intel XE#324]) -> [FAIL][88] ([Intel XE#1231])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3492]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3492
  [Intel XE#3699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3699
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -> xe-pw-142153v1

  IGT_8138: 8138
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e80658ab760d899ae2
  xe-pw-142153v1: 142153v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/index.html

--===============7680814054520684160==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: clean up DP Adaptive Sync =
SDP state mismatch logging</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142153/">https://patchwork.freedesktop.org/series/142153/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142153v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142153v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760=
d899ae2_full -&gt; xe-pw-142153v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142153v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142153v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
53v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_async_flips@alternate-sync-async-flip-atomic:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-1/igt@km=
s_async_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> +1 othe=
r test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-4/igt@km=
s_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142153v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_mo=
dule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt=
@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-4=
66/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard=
-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2=
/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d=
899ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658=
ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8524044=
9e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8=
5240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4250668=
8c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4=
2506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-23=
23-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_loa=
d@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_modu=
le_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@x=
e_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435=
/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-d=
g2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/s=
hard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d89=
9ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab=
760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e8=
0658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8524=
0449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c0=
8f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4250=
6688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-=
6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@l=
oad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_=
load@load.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3699">Intel XE#3699</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@lo=
ad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/=
igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
53v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_mo=
dule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142153v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shar=
d-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load=
@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434=
/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-434/igt@xe_module_load@load.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
153v1/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_m=
odule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/sha=
rd-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-435/igt@xe_module_loa=
d@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142153v1/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-46=
6/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2153v1/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_=
module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_load@load.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/sh=
ard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-dg2-466/igt@xe_module_lo=
ad@load.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142153v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp-6/igt@kms_async=
_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"=
>Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-adlp=
-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-3/igt@kms_flip@wf_vblank=
-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-3/igt@kms_pla=
ne_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2153v1/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clampi=
ng-pixel-formats@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel=
 XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_pm_r=
pm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_rpm@universal-plan=
es.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_pm_r=
pm@universal-planes@plane-32.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_pm_rpm@unive=
rsal-planes@plane-32.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-7/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-5/igt@xe_exec_sip=
_eudebug@wait-writesip-nodebug.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3492">Intel XE#3492</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142153v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1=
358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
07">Intel XE#1607</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_cur=
sor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v=
1/shard-adlp-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip=
@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shar=
d-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-5/igt@kms_f=
lip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@xe_modu=
le_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142153v1/shard-a=
dlp-9/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142153v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -&gt; xe-pw-142=
153v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e=
80658ab760d899ae2<br />
  xe-pw-142153v1: 142153v1</p>

</body>
</html>

--===============7680814054520684160==--
