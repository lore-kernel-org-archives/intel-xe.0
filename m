Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D52BE6ADF9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 21:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C02510E268;
	Mon, 22 Dec 2025 21:49:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5310E08C;
 Mon, 22 Dec 2025 21:49:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6104311523330061463=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_trans_push_mechanism_t?=
 =?utf-8?q?o_generate_frame_change_event_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 21:49:43 -0000
Message-ID: <176644018378.112879.4393872158439664242@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219130537.3024373-1-jouni.hogander@intel.com>
In-Reply-To: <20251219130537.3024373-1-jouni.hogander@intel.com>
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

--===============6104311523330061463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use trans push mechanism to generate frame change event (rev8)
URL   : https://patchwork.freedesktop.org/series/139831/
State : failure

== Summary ==

CI Bug Log - changes from xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72_FULL -> xe-pw-139831v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139831v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139831v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139831v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_psr@psr-sprite-blt@edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +17 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@kms_psr@psr-sprite-blt@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@kms_psr@psr-sprite-blt@edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-139831v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6914])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@core_getversion@all-cards.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@fbdev@unaligned-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@fbdev@unaligned-write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#5177] / [Intel XE#6703])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@intel_hwmon@hwmon-read.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2291])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#5299])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2316]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#6703]) +441 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6703]) +185 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [PASS][25] -> [ABORT][26] ([Intel XE#6740]) +3 other tests abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6886]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#6693])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_pm_rpm@basic-rte.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6693])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1435])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#6557] / [Intel XE#6703]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_exec_balancer@twice-virtual-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2229])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#6913])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#6251])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][42] ([Intel XE#6779]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][44] ([Intel XE#6815]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][46] ([Intel XE#2134]) -> [PASS][47] +2 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@fbdev@nullptr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][48] ([Intel XE#6703]) -> [PASS][49] +620 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][50] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][52] ([Intel XE#2291]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][54] ([Intel XE#2316]) -> [PASS][55] +2 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][56] ([Intel XE#6693]) -> [PASS][57] +3 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_pm_rpm@i2c.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][58] ([Intel XE#6321]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - shard-bmg:          [SKIP][60] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][61] +7 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [DMESG-WARN][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][64] ([Intel XE#6251]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][66] -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@gt-frequency.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][68] ([Intel XE#2327]) -> [SKIP][69] ([Intel XE#6703]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#2327]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#1124]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][74] ([Intel XE#1124]) -> [SKIP][75] ([Intel XE#6703]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][76] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][78] ([Intel XE#6703]) -> [SKIP][79] ([Intel XE#2314] / [Intel XE#2894])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#367]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][82] ([Intel XE#367]) -> [SKIP][83] ([Intel XE#6703]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][84] ([Intel XE#2887]) -> [SKIP][85] ([Intel XE#6703]) +10 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][86] ([Intel XE#3432]) -> [SKIP][87] ([Intel XE#6703]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#2887]) +18 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][90] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][91] ([Intel XE#6703]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#2724]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][94] ([Intel XE#2325]) -> [SKIP][95] ([Intel XE#6703]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#2325])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#2252]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][100] ([Intel XE#2252]) -> [SKIP][101] ([Intel XE#6703]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][102] ([Intel XE#6507]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#6743])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][106] ([Intel XE#6703]) -> [SKIP][107] ([Intel XE#2390])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][108] ([Intel XE#2341]) -> [SKIP][109] ([Intel XE#6703]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_content_protection@lic-type-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#2341])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][112] ([Intel XE#2320]) -> [SKIP][113] ([Intel XE#6703]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#2321]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#2320]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][118] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][119] ([Intel XE#2320])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#2286])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#4354]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#2244])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][126] ([Intel XE#2244]) -> [SKIP][127] ([Intel XE#6703]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#4156])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][130] ([Intel XE#6703]) -> [SKIP][131] ([Intel XE#776])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#1138])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#2374])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][136] ([Intel XE#6703]) -> [SKIP][137] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][138] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][139] ([Intel XE#6703]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][140] ([Intel XE#2312]) -> [SKIP][141] ([Intel XE#2311]) +9 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][142] ([Intel XE#2311]) -> [SKIP][143] ([Intel XE#6703]) +23 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][144] ([Intel XE#6703]) -> [SKIP][145] ([Intel XE#2311]) +28 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][146] ([Intel XE#6703]) -> [SKIP][147] ([Intel XE#4141]) +14 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][148] ([Intel XE#4141]) -> [SKIP][149] ([Intel XE#6703]) +10 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][150] ([Intel XE#4141]) -> [SKIP][151] ([Intel XE#2312]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][153] ([Intel XE#4141])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][154] ([Intel XE#2312]) -> [SKIP][155] ([Intel XE#4141]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#2352])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][158] ([Intel XE#2311]) -> [SKIP][159] ([Intel XE#2312]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][160] ([Intel XE#2311]) -> [SKIP][161] ([Intel XE#6557] / [Intel XE#6703])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][162] ([Intel XE#6703]) -> [SKIP][163] ([Intel XE#2313]) +30 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][164] ([Intel XE#2313]) -> [SKIP][165] ([Intel XE#2312]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][166] ([Intel XE#2352]) -> [SKIP][167] ([Intel XE#6703])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][168] ([Intel XE#2313]) -> [SKIP][169] ([Intel XE#6703]) +21 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#2313]) +8 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [ABORT][172] ([Intel XE#6740]) -> [SKIP][173] ([Intel XE#6703]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_hdr@bpc-switch.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#4298])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#6911])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][178] ([Intel XE#2925]) -> [SKIP][179] ([Intel XE#6703])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][180] ([Intel XE#2486]) -> [SKIP][181] ([Intel XE#6703])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2393])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][184] ([Intel XE#5021]) -> [SKIP][185] ([Intel XE#6703])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [SKIP][187] ([Intel XE#5020])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#6886])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#2938])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][192] ([Intel XE#870]) -> [SKIP][193] ([Intel XE#6703])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][194] ([Intel XE#6703]) -> [SKIP][195] ([Intel XE#3309])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][196] ([Intel XE#2392]) -> [SKIP][197] ([Intel XE#6703])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][198] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][199] ([Intel XE#6693])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][200] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][201] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][202] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][203] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][204] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][205] ([Intel XE#1406] / [Intel XE#6703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][206] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][207] ([Intel XE#1406] / [Intel XE#6703]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][208] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][209] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][210] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][211] ([Intel XE#1406] / [Intel XE#2414])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][212] ([Intel XE#6703]) -> [SKIP][213] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][214] ([Intel XE#2330]) -> [SKIP][215] ([Intel XE#6703]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][216] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][217] ([Intel XE#6703]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][218] ([Intel XE#6503]) -> [SKIP][219] ([Intel XE#6703])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_sharpness_filter@filter-basic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][220] ([Intel XE#6703]) -> [SKIP][221] ([Intel XE#6503]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][222] ([Intel XE#1729]) -> [SKIP][223] ([Intel XE#2426])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][224] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][225] ([Intel XE#2450])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][226] ([Intel XE#2168]) -> [SKIP][227] ([Intel XE#6703])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_vrr@cmrr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][228] ([Intel XE#1499]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_vrr@flip-dpms.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][230] ([Intel XE#6703]) -> [SKIP][231] ([Intel XE#6599])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][232] ([Intel XE#6703]) -> [SKIP][233] ([Intel XE#4837]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][234] ([Intel XE#4837]) -> [SKIP][235] ([Intel XE#6557] / [Intel XE#6703])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          [SKIP][236] ([Intel XE#4837]) -> [SKIP][237] ([Intel XE#6703]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_eudebug@basic-vms.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][238] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][239] ([Intel XE#6703]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][240] ([Intel XE#6703]) -> [SKIP][241] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][242] ([Intel XE#6703]) -> [SKIP][243] ([Intel XE#5793])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][244] ([Intel XE#6703]) -> [SKIP][245] ([Intel XE#2322]) +9 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][246] ([Intel XE#2322]) -> [SKIP][247] ([Intel XE#6703]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][248] ([Intel XE#6703]) -> [SKIP][249] ([Intel XE#6874]) +29 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          [SKIP][250] ([Intel XE#6874]) -> [SKIP][251] ([Intel XE#6703]) +20 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-priority-smem.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][252] ([Intel XE#6703]) -> [SKIP][253] ([Intel XE#5007])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][254] ([Intel XE#6703]) -> [SKIP][255] ([Intel XE#4943]) +25 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][256] ([Intel XE#4943]) -> [SKIP][257] ([Intel XE#6703]) +20 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][258] ([Intel XE#6703]) -> [SKIP][259] ([Intel XE#6281])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][260] ([Intel XE#6703]) -> [ABORT][261] ([Intel XE#5466])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][262] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][263] ([Intel XE#6703])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][264] ([Intel XE#5694]) -> [SKIP][265] ([Intel XE#6703])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_pm@d3cold-i2c.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][266] ([Intel XE#6703]) -> [SKIP][267] ([Intel XE#5742])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][268] ([Intel XE#6703]) -> [SKIP][269] ([Intel XE#2284])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][270] ([Intel XE#6703]) -> [SKIP][271] ([Intel XE#579])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][272] ([Intel XE#4733]) -> [SKIP][273] ([Intel XE#6703]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][274] ([Intel XE#6703]) -> [SKIP][275] ([Intel XE#4733]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][276] ([Intel XE#6703]) -> [SKIP][277] ([Intel XE#944]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][278] ([Intel XE#944]) -> [SKIP][279] ([Intel XE#6703]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72 -> xe-pw-139831v8

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72
  xe-pw-139831v8: 139831v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/index.html

--===============6104311523330061463==
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
<tr><td><b>Series:</b></td><td>Use trans push mechanism to generate frame change event (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139831/">https://patchwork.freedesktop.org/series/139831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72_FULL -&gt; xe-pw-139831v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139831v8_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139831v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139831v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@kms_psr@psr-sprite-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@kms_psr@psr-sprite-blt@edp-1.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139831v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914">Intel XE#6914</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +441 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel XE#6815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@fbdev@nullptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_addfb_basic@unused-handle.html">PASS</a> +620 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-lnl-5/igt@xe_pmu@gt-frequency.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-lnl-4/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_hdr@bpc-switch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-9/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/shard-bmg-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72 -&gt; xe-pw-139831v8</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72<br />
  xe-pw-139831v8: 139831v8</p>

</body>
</html>

--===============6104311523330061463==--
