Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22592D65C6C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 10:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF53D10E7DC;
	Thu, 14 Nov 2024 10:21:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AECD10E7EB;
 Thu, 14 Nov 2024 10:21:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6196902806363965895=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_TTM_shrinker_helpers_and_xe_buf?=
 =?utf-8?q?fer_object_shrinker_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 10:21:51 -0000
Message-ID: <173157971122.4035500.5523654800531116805@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
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

--===============6196902806363965895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev12)
URL   : https://patchwork.freedesktop.org/series/131815/
State : failure

== Summary ==

CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_full -> xe-pw-131815v12_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131815v12_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131815v12_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131815v12_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][6] -> [FAIL][7] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-lnl:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][16] -> [DMESG-FAIL][17] +3 other tests dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] +2 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html
    - shard-dg2-set2:     [PASS][20] -> [DMESG-FAIL][21] +2 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pat@prime-external-import-coh:
    - shard-lnl:          [PASS][22] -> [DMESG-FAIL][23] +2 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pat@prime-external-import-coh.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_pat@prime-external-import-coh.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     [FAIL][26] ([Intel XE#1173]) -> [DMESG-FAIL][27] +1 other test dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
Known issues
------------

  Here are the changes found in xe-pw-131815v12_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#1885]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2134]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@fbdev@write.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#827]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2550]) +23 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-transition:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2423] / [i915#2575])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2327])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-adlp:         [PASS][41] -> [TIMEOUT][42] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#877]) +1 other test dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#316])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][48] ([Intel XE#3052])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1231] / [Intel XE#1242])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1124])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +160 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#787]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#1727])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1195] / [Intel XE#3113])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#306])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#373]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#3407])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#307])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#3304])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1188])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#2423] / [i915#2575]) +93 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#308])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#309])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#877])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1475])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#1475])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#455]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#2423])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_dp_aux_dev.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#2882]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#310]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301]) +3 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1421]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-adlp:         [PASS][83] -> [DMESG-WARN][84] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip@absolute-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][85] -> [FAIL][86] ([Intel XE#2882]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-adlp:         [PASS][87] -> [FAIL][88] ([Intel XE#3335])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#886]) +6 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][91] -> [FAIL][92] ([Intel XE#886]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][93] -> [FAIL][94] ([Intel XE#301]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#2882]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2136]) +33 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2380]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#455]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2293])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#1491]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][105] -> [FAIL][106] ([Intel XE#1874]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2136] / [Intel XE#2351])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#656]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][109] ([Intel XE#1861])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2136]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#651]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#651])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2311]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#651]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#653]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#656]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2313]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#653]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#3404])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][120] ([Intel XE#1035] / [Intel XE#1195])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][121] ([Intel XE#2078]) +1 other test warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2493])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2763]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2763] / [Intel XE#455])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2763]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#1430])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-lnl:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#2932] / [Intel XE#3184])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_pm_rpm@cursor.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-7/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         [PASS][131] -> [DMESG-WARN][132] ([Intel XE#3086])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#2446]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1489])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1489])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1489])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2850] / [Intel XE#929])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1127])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][143] -> [FAIL][144] ([Intel XE#1523]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_vblank@accuracy-idle.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-5/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#2168])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#756])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#2667])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2905])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2905])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][152] ([Intel XE#1473])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][153] ([Intel XE#1473])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#1130]) +180 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1392]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1130]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#288]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2905]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][161] -> [SKIP][162] ([Intel XE#2229]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2833])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2541]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][165] ([Intel XE#2249])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#2541]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2284] / [Intel XE#366])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][168] -> [ABORT][169] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - shard-adlp:         [PASS][171] -> [TIMEOUT][172] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][173] ([Intel XE#3440]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_getversion@all-cards.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1885]) -> [PASS][176] +2 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2134]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@fbdev@nullptr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@fbdev@nullptr.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [FAIL][179] ([Intel XE#1874]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_async_flips@crc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-1/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][181] ([Intel XE#1701]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][184] +4 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [TIMEOUT][185] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#3086]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-lnl:          [DMESG-WARN][193] -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][195] -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#301]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][199] ([Intel XE#886]) -> [PASS][200] +6 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [PASS][202] +99 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@busy-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][203] ([Intel XE#2882]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][205] ([Intel XE#3403] / [Intel XE#886]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2136]) -> [PASS][208] +39 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#455]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][211] ([Intel XE#1503]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][213] ([Intel XE#3184]) -> [PASS][214] +2 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2446]) -> [PASS][216] +4 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][217] ([Intel XE#2042]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [DMESG-WARN][219] ([Intel XE#2055]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][221] ([Intel XE#1630]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][223] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#2136]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][227] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][229] ([Intel XE#1794]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - shard-adlp:         [TIMEOUT][231] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][232] +2 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm_residency@gt-c6-on-idle.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1130]) -> [PASS][234] +181 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#316]) -> [SKIP][236] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][237] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [SKIP][238] ([Intel XE#1124])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#316]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#316]) -> [SKIP][242] ([Intel XE#2136]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][243] ([Intel XE#3194]) -> [FAIL][244] ([Intel XE#1231] / [Intel XE#1242])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][245] -> [FAIL][246] ([Intel XE#1231] / [Intel XE#1242])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1124]) -> [SKIP][248] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][250] ([Intel XE#607])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][251] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][252] ([Intel XE#324]) +1 other test dmesg-fail
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][254] ([Intel XE#1124]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1124]) -> [SKIP][256] ([Intel XE#2136]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#1124]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#367]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2191]) -> [SKIP][262] ([Intel XE#2423] / [i915#2575])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [SKIP][264] ([Intel XE#2191])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#367]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136]) -> [SKIP][268] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][270] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] -> [SKIP][272] ([Intel XE#455] / [Intel XE#787])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2907]) -> [SKIP][274] ([Intel XE#2136]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][276] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][278] ([Intel XE#2136]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#314]) -> [SKIP][280] ([Intel XE#2136] / [Intel XE#2351])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#306]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#306]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_chamelium_color@gamma.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#373]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#373]) +12 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#307]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [SKIP][292] ([Intel XE#307])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#455]) +7 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [FAIL][296] ([Intel XE#1188])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@uevent.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#308]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2423] / [i915#2575]) -> [SKIP][300] ([Intel XE#323]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2351]) -> [SKIP][302] ([Intel XE#455])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         [TIMEOUT][303] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][304] ([Intel XE#776])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_fbcon_fbt@psr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#776]) -> [SKIP][306] ([Intel XE#2136])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#701])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#703]) -> [SKIP][310] ([Intel XE#2423] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1135]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2423] / [i915#2575]) -> [FAIL][314] ([Intel XE#301])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][315] ([Intel XE#301]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][318] ([Intel XE#455])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136]) -> [SKIP][320] ([Intel XE#455]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#455]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#455]) -> [SKIP][324] ([Intel XE#2136]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][325] ([Intel XE#3194]) -> [DMESG-FAIL][326] ([Intel XE#324]) +5 other tests dmesg-fail
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#651]) -> [SKIP][328] ([Intel XE#2136]) +26 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#651]) +19 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][332] ([Intel XE#651]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][333] ([Intel XE#1861]) -> [TIMEOUT][334] ([Intel XE#1033] / [Intel XE#1727])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][335] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][336] ([Intel XE#1861])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#651]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#658]) -> [SKIP][340] ([Intel XE#2136] / [Intel XE#2351])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][342] ([Intel XE#653]) +5 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#653]) -> [SKIP][344] ([Intel XE#2136]) +25 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#653]) -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#653]) +31 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#346]) -> [SKIP][350] ([Intel XE#2136])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#2927])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][353] ([Intel XE#1035]) -> [INCOMPLETE][354] ([Intel XE#1035] / [Intel XE#1195])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_plane@pixel-format.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][356] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2423] / [i915#2575]) -> [SKIP][358] ([Intel XE#2763] / [Intel XE#455])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136]) -> [SKIP][360] ([Intel XE#870]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136]) -> [SKIP][362] ([Intel XE#2938])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#870]) -> [SKIP][364] ([Intel XE#2136])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][365] ([Intel XE#734]) -> [FAIL][366] ([Intel XE#3325])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#908])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1489]) -> [SKIP][370] ([Intel XE#2136]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136]) -> [SKIP][372] ([Intel XE#1489]) +10 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1122]) -> [SKIP][374] ([Intel XE#2136]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][376] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][378] ([Intel XE#2136]) +10 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2136]) -> [SKIP][380] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr@pr-dpms.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][384] ([Intel XE#2351])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2351]) -> [SKIP][386] ([Intel XE#2850] / [Intel XE#929])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2939]) -> [SKIP][388] ([Intel XE#2136])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2423] / [i915#2575]) -> [SKIP][390] ([Intel XE#3414]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1127]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#3414]) -> [SKIP][394] ([Intel XE#2423] / [i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#362]) -> [FAIL][396] ([Intel XE#1729])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][397] ([Intel XE#2509]) -> [SKIP][398] ([Intel XE#2426])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-idle:
    - shard-dg2-set2:     [FAIL][399] -> [SKIP][400] ([Intel XE#2423] / [i915#2575])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vblank@query-idle.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vblank@query-idle.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2168]) -> [SKIP][402] ([Intel XE#2423] / [i915#2575])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vrr@lobf.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#455]) -> [SKIP][404] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_vrr@max-min.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#756]) -> [SKIP][406] ([Intel XE#2423] / [i915#2575])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2423] / [i915#2575]) -> [SKIP][408] ([Intel XE#756]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2423] / [i915#2575]) -> [SKIP][410] ([Intel XE#1091] / [Intel XE#2849])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][412] ([Intel XE#1130]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1123]) -> [SKIP][414] ([Intel XE#1130])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1126]) -> [SKIP][416] ([Intel XE#1130])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1130]) -> [SKIP][418] ([Intel XE#1126]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2905]) -> [SKIP][420] ([Intel XE#1130]) +10 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1130]) -> [TIMEOUT][422] ([Intel XE#1473])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][423] ([Intel XE#1473]) -> [INCOMPLETE][424] ([Intel XE#1473])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#288]) -> [SKIP][426] ([Intel XE#1130]) +30 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1130]) -> [SKIP][428] ([Intel XE#288]) +29 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1130]) -> [SKIP][430] ([Intel XE#2905]) +14 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#512]) -> [SKIP][432] ([Intel XE#1130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_mmap@small-bar.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1130]) -> [SKIP][434] ([Intel XE#2541]) +6 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2541]) -> [SKIP][436] ([Intel XE#1130]) +8 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1130]) -> [SKIP][438] ([Intel XE#979])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][440] ([Intel XE#1130]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1130]) -> [SKIP][442] ([Intel XE#2284] / [Intel XE#366])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1130]) -> [SKIP][444] ([Intel XE#944]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#944]) -> [SKIP][446] ([Intel XE#1130]) +2 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1130]) -> [FAIL][448] ([Intel XE#2922])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_tlb@basic-tlb.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1130]) -> [DMESG-WARN][450] ([Intel XE#2919])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_wedged@basic-wedged.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][451] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][452] ([Intel XE#1130])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3335]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3335
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -> xe-pw-131815v12

  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70
  xe-pw-131815v12: 131815v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html

--===============6196902806363965895==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_full -&gt; xe-pw-131815v12_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131815v12_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131815v12_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131815v12_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131815v12_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_flip@absolute-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3335">Intel XE#3335</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-5/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-7/igt@kms_pm_rpm@cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +180 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@core_hotunplug@hotreplug.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-1/igt@kms_async_flips@crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_flip@busy-flip.html">PASS</a> +99 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403">Intel XE#3403</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@xe_pm_residency@gt-c6-on-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html">PASS</a> +181 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_fbcon_fbt@psr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vblank@query-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vblank@query-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-433/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-463/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -&gt; xe-pw-131815v12</li>
</ul>
<p>IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70<br />
  xe-pw-131815v12: 131815v12</p>

</body>
</html>

--===============6196902806363965895==--
