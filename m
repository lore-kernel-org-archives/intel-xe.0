Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE62BFF8850
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 23:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4F10E40A;
	Fri, 24 Apr 2026 23:15:24 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411D10E40A;
 Fri, 24 Apr 2026 23:15:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7543538556696760197=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Engine_initialization_clea?=
 =?utf-8?q?nup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 23:15:23 -0000
Message-ID: <177707252378.7958.4073055785283781247@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
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

--===============7543538556696760197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Engine initialization cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/165392/
State : failure

== Summary ==

CI Bug Log - changes from xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_FULL -> xe-pw-165392v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165392v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165392v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165392v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][2] -> [SKIP][3] +38 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_evict@evict-large-external-cm.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][6] ([Intel XE#7825]) -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_content_protection@lic-type-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][8] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][10] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][12] ([Intel XE#6321]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][14] ([Intel XE#7140]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_evict@evict-threads-small-multi-queue.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-bmg:          [SKIP][16] ([Intel XE#7826]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@once-rebind-imm.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][18] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][20] ([Intel XE#7599]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fault-svm.html

  
Known issues
------------

  Here are the changes found in xe-pw-165392v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2134]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@fbdev@nullptr.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#7445])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2233])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#7825]) +52 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_atomic@plane-invalid-params.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2705] / [Intel XE#6904])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2370])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][32] -> [INCOMPLETE][33] ([Intel XE#2705])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2327]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][38] ([Intel XE#7084])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2724] / [Intel XE#7449])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2325] / [Intel XE#7358])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@ctm-0-25:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#3297]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_color@ctm-0-25.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_color@ctm-0-25.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321] / [Intel XE#7355])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#6841]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  * igt@kms_dp_aux_dev@basic:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#3009])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_dp_aux_dev@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_dp_aux_dev@basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4422] / [Intel XE#7442])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#6266] / [Intel XE#7705])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#6266])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@a-dp2.html

  * igt@kms_flip@blocking-wf_vblank@c-dp2:
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#7705]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@c-dp2.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@c-dp2.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2482]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_flip@wf_vblank-ts-check.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#7178])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2380]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2682])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +9 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][69] ([Intel XE#2594])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4141]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7061] / [Intel XE#7356])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2548] / [Intel XE#6314])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2568]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_invalid_mode@bad-hsync-end.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4298] / [Intel XE#5873])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7130]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7283])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#7111]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_plane@plane-panning-bottom-right.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#7082]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#5020] / [Intel XE#7348])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#7687])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_scaling@invalid-parameters.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2763] / [Intel XE#6886]) +19 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#7089])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_properties@colorop-properties-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#7112])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_properties@crtc-properties-atomic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7795])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1435])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#1435])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_debugfs@check-gt-reg-sr@gt0:
    - shard-bmg:          [PASS][104] -> [FAIL][105] ([Intel XE#7706]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_debugfs@check-gt-reg-sr@gt0.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_debugfs@check-gt-reg-sr@gt0.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#6568]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_eu_stall@blocking-re-enable.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7636]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#7827]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2322] / [Intel XE#7372])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#7136]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#7826]) +24 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#6874]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#7824]) +310 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_exec_threads@threads-cm-fd-userptr:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#6703]) +29 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_threads@threads-cm-fd-userptr.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#7138]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#6964])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#7793])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#7590])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_pat@false-sharing.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_pat@false-sharing.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [PASS][125] -> [FAIL][126] ([Intel XE#7695])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4733] / [Intel XE#7417])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][129] ([Intel XE#2134]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@fbdev@write.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][131] ([Intel XE#7825]) -> [PASS][132] +45 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@x-tiled-addfb.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-bmg:          [SKIP][133] ([Intel XE#7006]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_color_pipeline@plane-ctm3x4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][135] ([Intel XE#2316]) -> [PASS][136] +3 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][137] ([Intel XE#6266]) -> [PASS][138] +3 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][139] ([Intel XE#3149] / [Intel XE#6266]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [FAIL][141] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][143] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-bmg:          [SKIP][145] ([Intel XE#2482]) -> [PASS][146] +6 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@basic-flip-vs-modeset.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-bmg:          [SKIP][147] ([Intel XE#7178]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][149] ([Intel XE#2380]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][151] ([Intel XE#7086]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][153] ([Intel XE#7283]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [SKIP][155] ([Intel XE#7111]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][157] ([Intel XE#2571] / [Intel XE#7343]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-bmg:          [SKIP][159] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][160] +19 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][161] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][163] ([Intel XE#7079]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@i2c.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][165] ([Intel XE#4886]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][167] ([Intel XE#4227]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-bmg:          [SKIP][169] ([Intel XE#6568]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][171] -> [PASS][172] +27 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-bmg:          [SKIP][173] ([Intel XE#7827]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@once-virtual-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - shard-bmg:          [SKIP][175] ([Intel XE#7826]) -> [PASS][176] +18 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:
    - shard-bmg:          [FAIL][177] -> [PASS][178] +8 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [SKIP][179] ([Intel XE#7824]) -> [PASS][180] +232 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read:
    - shard-bmg:          [DMESG-WARN][181] ([Intel XE#7725]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [ABORT][183] ([Intel XE#5545]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          [SKIP][185] ([Intel XE#7590]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_pat@display-vs-wb-transient.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][187] ([Intel XE#7825]) -> [SKIP][188] ([Intel XE#2327]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][189] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][190] ([Intel XE#7825]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][191] ([Intel XE#2327]) -> [SKIP][192] ([Intel XE#7825]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][193] ([Intel XE#7825]) -> [SKIP][194] ([Intel XE#1124]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][195] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][196] ([Intel XE#7825])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][197] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][198] ([Intel XE#7825])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][199] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][200] ([Intel XE#7825])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][201] ([Intel XE#1124]) -> [SKIP][202] ([Intel XE#7825]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][203] ([Intel XE#2887]) -> [SKIP][204] ([Intel XE#7825]) +14 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][205] ([Intel XE#7825]) -> [SKIP][206] ([Intel XE#2652])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][207] ([Intel XE#7825]) -> [INCOMPLETE][208] ([Intel XE#7084])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][209] ([Intel XE#7825]) -> [SKIP][210] ([Intel XE#3432])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][211] ([Intel XE#3432]) -> [SKIP][212] ([Intel XE#7825]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][213] ([Intel XE#7825]) -> [SKIP][214] ([Intel XE#2887]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][215] -> [SKIP][216] ([Intel XE#2724] / [Intel XE#7449])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cdclk@mode-transition.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][217] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][218] ([Intel XE#6703])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_chamelium_color@gamma.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          [SKIP][219] ([Intel XE#2252]) -> [SKIP][220] ([Intel XE#6703])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][221] ([Intel XE#3297]) -> [SKIP][222] ([Intel XE#6703])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_color@ctm-blue-to-red.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][223] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][224] ([Intel XE#7825])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_content_protection@atomic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][225] ([Intel XE#3304] / [Intel XE#7374]) -> [SKIP][226] ([Intel XE#7825])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][227] ([Intel XE#7642]) -> [SKIP][228] ([Intel XE#7825])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_content_protection@content-type-change.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][229] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][230] ([Intel XE#7825])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][231] ([Intel XE#7825]) -> [SKIP][232] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][233] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][234] ([Intel XE#7825])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][235] ([Intel XE#7825]) -> [SKIP][236] ([Intel XE#2320]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][237] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][238] ([Intel XE#7825])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][239] ([Intel XE#7825]) -> [SKIP][240] ([Intel XE#2321] / [Intel XE#7355])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][241] ([Intel XE#2320]) -> [SKIP][242] ([Intel XE#7825]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-bmg:          [SKIP][243] ([Intel XE#7825]) -> [FAIL][244] ([Intel XE#6841])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][245] ([Intel XE#7825]) -> [SKIP][246] ([Intel XE#2286] / [Intel XE#6035])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][247] ([Intel XE#7825]) -> [SKIP][248] ([Intel XE#1508])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][249] ([Intel XE#2244]) -> [SKIP][250] ([Intel XE#7825]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][251] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][252] ([Intel XE#7825])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][253] ([Intel XE#2316]) -> [SKIP][254] ([Intel XE#6703]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][255] ([Intel XE#7178]) -> [SKIP][256] ([Intel XE#7178] / [Intel XE#7349])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][257] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][258] ([Intel XE#7178])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-bmg:          [SKIP][259] ([Intel XE#2380]) -> [SKIP][260] ([Intel XE#6703]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][261] ([Intel XE#2380]) -> [SKIP][262] ([Intel XE#7178] / [Intel XE#7351])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][263] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][264] ([Intel XE#2311]) +13 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][265] ([Intel XE#2311]) -> [SKIP][266] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +22 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][268] ([Intel XE#6703]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#6314]) -> [SKIP][270] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][271] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][272] ([Intel XE#6314]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#6314]) -> [SKIP][274] ([Intel XE#4141])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][275] ([Intel XE#4141]) -> [SKIP][276] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][278] ([Intel XE#4141]) +10 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][279] ([Intel XE#2312]) -> [SKIP][280] ([Intel XE#4141])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][281] ([Intel XE#4141]) -> [SKIP][282] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][283] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][284] ([Intel XE#4141])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#6314]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][287] ([Intel XE#6314]) -> [SKIP][288] ([Intel XE#2311]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][289] ([Intel XE#2312]) -> [SKIP][290] ([Intel XE#2311])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][291] ([Intel XE#2311]) -> [SKIP][292] ([Intel XE#2548] / [Intel XE#6314]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][293] ([Intel XE#6314]) -> [SKIP][294] ([Intel XE#6703]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-bmg:          [SKIP][295] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][296] ([Intel XE#2311]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2313]) -> [SKIP][298] ([Intel XE#6314]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][299] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][300] ([Intel XE#6703]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][301] ([Intel XE#2313]) -> [SKIP][302] ([Intel XE#2548] / [Intel XE#6314]) +26 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][303] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][304] ([Intel XE#2548] / [Intel XE#6314])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][305] ([Intel XE#6314]) -> [SKIP][306] ([Intel XE#2313])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][308] ([Intel XE#2313]) +19 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#2313])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-bmg:          [SKIP][311] ([Intel XE#2568]) -> [SKIP][312] ([Intel XE#6703])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-start.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][313] ([Intel XE#2486]) -> [SKIP][314] ([Intel XE#7825]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_panel_fitting@legacy.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][315] ([Intel XE#7825]) -> [SKIP][316] ([Intel XE#6912] / [Intel XE#7375])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-bmg:          [SKIP][317] ([Intel XE#7283]) -> [SKIP][318] ([Intel XE#6703])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][319] ([Intel XE#2393]) -> [SKIP][320] ([Intel XE#7825])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][321] ([Intel XE#7825]) -> [SKIP][322] ([Intel XE#2393])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_lowres@tiling-yf.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][323] ([Intel XE#7825]) -> [SKIP][324] ([Intel XE#6703]) +19 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-bmg:          [SKIP][325] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][326] ([Intel XE#6703])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][327] ([Intel XE#7376] / [Intel XE#870]) -> [SKIP][328] ([Intel XE#6703])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_backlight@fade-with-dpms.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][329] ([Intel XE#4886]) -> [SKIP][330] ([Intel XE#6703])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@legacy-planes-dpms.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][331] ([Intel XE#1489]) -> [SKIP][332] ([Intel XE#6703])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          [SKIP][333] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][334] ([Intel XE#6703]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_psr@psr2-sprite-plane-onoff.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][335] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][336] ([Intel XE#7825]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][337] ([Intel XE#2413]) -> [SKIP][338] ([Intel XE#7825])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][339] ([Intel XE#6503]) -> [SKIP][340] ([Intel XE#7825]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][341] ([Intel XE#7825]) -> [SKIP][342] ([Intel XE#6503])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][343] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][344] ([Intel XE#7825])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_vrr@lobf.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][345] ([Intel XE#7825]) -> [SKIP][346] ([Intel XE#1499])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-bmg:          [SKIP][347] -> [SKIP][348] ([Intel XE#6703]) +11 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_copy_basic@mem-set-linear-0x369.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          [SKIP][349] ([Intel XE#7636]) -> [SKIP][350] ([Intel XE#6703]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-extended.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][351] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464]) -> [SKIP][352] ([Intel XE#6703])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eudebug_sriov@deny-eudebug.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][353] -> [INCOMPLETE][354] ([Intel XE#6321])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - shard-bmg:          [SKIP][355] ([Intel XE#7827]) -> [SKIP][356] ([Intel XE#6703])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          [SKIP][357] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][358] ([Intel XE#6703])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][359] ([Intel XE#7826]) -> [SKIP][360] ([Intel XE#7136]) +8 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][361] ([Intel XE#7136]) -> [SKIP][362] ([Intel XE#7826]) +12 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][363] ([Intel XE#7826]) -> [SKIP][364] ([Intel XE#6703]) +7 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          [SKIP][365] ([Intel XE#6874]) -> [SKIP][366] ([Intel XE#6703]) +6 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-basic.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - shard-bmg:          [SKIP][367] ([Intel XE#7824]) -> [SKIP][368] ([Intel XE#6557] / [Intel XE#6703])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - shard-bmg:          [SKIP][369] ([Intel XE#7824]) -> [SKIP][370] ([Intel XE#6703]) +61 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          [SKIP][371] ([Intel XE#7138]) -> [SKIP][372] ([Intel XE#6703]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][373] ([Intel XE#7323] / [Intel XE#7384]) -> [SKIP][374] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_mmap@small-bar.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [SKIP][375] ([Intel XE#7590]) -> [SKIP][376] ([Intel XE#6703])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][377] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][378] ([Intel XE#6703])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][379] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][380] ([Intel XE#6703])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][381] ([Intel XE#944]) -> [SKIP][382] ([Intel XE#6703])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [DMESG-FAIL][383] -> [SKIP][384] ([Intel XE#6703])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7079]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7706
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#7827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f -> xe-pw-165392v2

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f: 6784fa94a98ae6fceef9c2c171c3e9fb8be6585f
  xe-pw-165392v2: 165392v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/index.html

--===============7543538556696760197==
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
<tr><td><b>Series:</b></td><td>Engine initialization cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165392/">https://patchwork.freedesktop.org/series/165392/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f_FULL -&gt; xe-pw-165392v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165392v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165392v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165392v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_evict@evict-large-external-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-large-external-cm.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_svm_usrptr_madvise@svm-userptr-copy-madvise.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_fault_mode@once-rebind-imm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165392v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_atomic@plane-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904">Intel XE#6904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_plane@plane-panning-bottom-right.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_scaling@invalid-parameters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_properties@colorop-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_properties@colorop-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089">Intel XE#7089</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@check-gt-reg-sr@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_debugfs@check-gt-reg-sr@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_debugfs@check-gt-reg-sr@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7706">Intel XE#7706</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_eu_stall@blocking-re-enable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_balancer@no-exec-cm-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +310 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_threads@threads-cm-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@xe_pat@false-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_pat@false-sharing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@cd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079">Intel XE#7079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_eu_stall@invalid-sampling-rate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_balancer@once-virtual-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> +232 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-fork-read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_pat@display-vs-wb-transient.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cdclk@mode-transition.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165392v2/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f -&gt; xe-pw-165392v2</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4935-6784fa94a98ae6fceef9c2c171c3e9fb8be6585f: 6784fa94a98ae6fceef9c2c171c3e9fb8be6585f<br />
  xe-pw-165392v2: 165392v2</p>

</body>
</html>

--===============7543538556696760197==--
