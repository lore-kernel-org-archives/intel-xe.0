Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163EAC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736010E79F;
	Wed,  2 Jul 2025 22:41:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EDE10E79F;
 Wed,  2 Jul 2025 22:41:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6530328876547635606=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Future-proof_for_multi-til?=
 =?utf-8?q?e_+_multi-GT_cases_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 22:41:51 -0000
Message-ID: <175149611152.129624.2249927135641139129@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
In-Reply-To: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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

--===============6530328876547635606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Future-proof for multi-tile + multi-GT cases (rev4)
URL   : https://patchwork.freedesktop.org/series/150192/
State : failure

== Summary ==

CI Bug Log - changes from xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8_FULL -> xe-pw-150192v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150192v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150192v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150192v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-150192v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#3768])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#3908]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-lnl:          [PASS][12] -> [ABORT][13] ([Intel XE#4760])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543]) +1 other test dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2907])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3862]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +76 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3113])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2724])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#5354])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#309])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1135])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#3098]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#4543]) +4 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][52] ([Intel XE#4543]) +4 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#4543]) +1 other test dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#653]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2486])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2938])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1489]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1489])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#3414])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1127])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1435]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4837]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4837]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#1392]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1392])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#288]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#3876])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#4915]) +36 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4915]) +53 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4943]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         NOTRUN -> [ABORT][89] ([Intel XE#4917])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#255])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2541] / [Intel XE#3573])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1173])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][93] -> [ABORT][94] ([Intel XE#5255])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_pm@s4-mocs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#944])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][97] ([Intel XE#911]) -> [PASS][98] +3 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@linear-addfb:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#4208]) -> [PASS][100] +2 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-addfb.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#4543]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][103] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#3124]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][111] ([Intel XE#2291]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][113] ([Intel XE#4302]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +3 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][117] ([Intel XE#301]) -> [PASS][118] +2 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#455]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][121] ([Intel XE#1503]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][123] ([Intel XE#4741]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#2883]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][130] +7 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][131] ([Intel XE#4819]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][134] ([Intel XE#316])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][135] ([Intel XE#1178]) -> [SKIP][136] ([Intel XE#2341])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_content_protection@srm.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][137] ([Intel XE#2312]) -> [SKIP][138] ([Intel XE#2311]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#2312]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][141] ([Intel XE#2312]) -> [SKIP][142] ([Intel XE#4141]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][143] ([Intel XE#2311]) -> [SKIP][144] ([Intel XE#2312]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][145] ([Intel XE#2313]) -> [SKIP][146] ([Intel XE#2312]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [SKIP][148] ([Intel XE#2313]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#4208]) -> [SKIP][150] ([Intel XE#653])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@xe_exec_system_allocator@once-malloc-race:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#4915]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_exec_system_allocator@once-malloc-race.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_exec_system_allocator@once-malloc-race.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1061]) -> [FAIL][154] ([Intel XE#1173])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_peer2peer@read.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#4208]) -> [TIMEOUT][156] ([Intel XE#5328])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255
  [Intel XE#5328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5328
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8 -> xe-pw-150192v4

  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8: e6e27e79a726f8bf333d13521aba32f6466035a8
  xe-pw-150192v4: 150192v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/index.html

--===============6530328876547635606==
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
<tr><td><b>Series:</b></td><td>Future-proof for multi-tile + multi-GT cases (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150192/">https://patchwork.freedesktop.org/series/150192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8_FULL -&gt; xe-pw-150192v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150192v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150192v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150192v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150192v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-73:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255">Intel XE#5255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-addfb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_exec_system_allocator@once-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_exec_system_allocator@once-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5328">Intel XE#5328</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8 -&gt; xe-pw-150192v4</li>
</ul>
<p>IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8: e6e27e79a726f8bf333d13521aba32f6466035a8<br />
  xe-pw-150192v4: 150192v4</p>

</body>
</html>

--===============6530328876547635606==--
