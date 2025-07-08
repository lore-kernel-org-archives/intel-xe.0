Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47EDC83F0A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 12:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708E10E61B;
	Tue,  8 Jul 2025 12:25:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335C10E05B;
 Tue,  8 Jul 2025 12:25:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4630115551628661794=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fair_DRM_scheduler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 12:25:42 -0000
Message-ID: <175197754238.143862.471877703319603768@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
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

--===============4630115551628661794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fair DRM scheduler
URL   : https://patchwork.freedesktop.org/series/151321/
State : failure

== Summary ==

CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL -> xe-pw-151321v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151321v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151321v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151321v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@queue-idle@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_sequence@queue-idle@pipe-c-dp-4.html

  
#### Warnings ####

  * igt@kms_sequence@queue-idle:
    - shard-dg2-set2:     [SKIP][2] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_sequence@queue-idle.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_sequence@queue-idle.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#4208]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
New tests
---------

  New tests have been introduced between xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL and xe-pw-151321v1_FULL:

### New IGT tests (3) ###

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  

Known issues
------------

  Here are the changes found in xe-pw-151321v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-adlp:         [PASS][6] -> [SKIP][7] ([Intel XE#2134])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@fbdev@eof.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@fbdev@eof.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#4208] / [i915#2575]) +39 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +181 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#3862]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#3442])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#3124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][30] ([Intel XE#1727] / [Intel XE#3113])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2724])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#4417]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2325])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][38] ([Intel XE#4820]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [PASS][39] -> [SKIP][40] ([Intel XE#4950]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_cursor_legacy@single-bo.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#4302])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#1340])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2244])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2373])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4208] / [i915#2575]) +28 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#301] / [Intel XE#3149])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#301]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][59] -> [DMESG-WARN][60] ([Intel XE#4543]) +3 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#4208]) +88 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][64] -> [DMESG-FAIL][65] ([Intel XE#4543]) +1 other test dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [PASS][67] -> [SKIP][68] ([Intel XE#4947]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2313]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#653]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1503])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2934])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#3012])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2393])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#5020])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#3414] / [Intel XE#3904])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#455]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1126])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4837])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2322])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#1392]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][88] -> [SKIP][89] ([Intel XE#4945]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_compute_mode@twice-basic.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#288])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#3868])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4837])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4943]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4915]) +19 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4208]) +161 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][97] -> [FAIL][98] ([Intel XE#4208])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_module_load@many-reload.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][99] ([Intel XE#4208]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][100] ([Intel XE#1173])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#579])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][102] -> [FAIL][103] ([Intel XE#4819]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#944])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#2134]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@fbdev@write.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#4543]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [INCOMPLETE][109] -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][111] ([Intel XE#2291]) -> [PASS][112] +8 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][113] ([Intel XE#2316]) -> [PASS][114] +5 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4208] / [i915#2575]) -> [PASS][116] +59 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][117] ([Intel XE#4543]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][120] +5 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][121] ([Intel XE#3012]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][123] ([Intel XE#4596]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][126] +7 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@kms_pm_rpm@i2c.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][127] ([Intel XE#1435]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#4208]) -> [PASS][130] +113 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1392]) -> [PASS][132] +4 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#4208] / [i915#2575]) -> [SKIP][134] ([Intel XE#623])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         [SKIP][135] ([Intel XE#1124]) -> [SKIP][136] ([Intel XE#4947]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#316]) -> [SKIP][138] ([Intel XE#4208]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#4208]) -> [SKIP][140] ([Intel XE#316])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][141] ([Intel XE#316]) -> [SKIP][142] ([Intel XE#4947])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][144] ([Intel XE#316])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1124]) -> [SKIP][146] ([Intel XE#2351] / [Intel XE#4208])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208]) -> [SKIP][148] ([Intel XE#1124]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1124]) -> [SKIP][150] ([Intel XE#4208]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][152] ([Intel XE#1124])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#4208] / [i915#2575]) -> [SKIP][154] ([Intel XE#2191])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2191]) -> [SKIP][156] ([Intel XE#4208] / [i915#2575])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#367]) -> [SKIP][158] ([Intel XE#4208] / [i915#2575])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#4208] / [i915#2575]) -> [SKIP][160] ([Intel XE#367])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][162] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][163] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#4947])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2907]) -> [SKIP][168] ([Intel XE#4208])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4208]) -> [SKIP][170] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [SKIP][172] ([Intel XE#4208])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][174] ([Intel XE#4208]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][176] ([Intel XE#4418])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#306]) -> [SKIP][178] ([Intel XE#4208] / [i915#2575])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#4208] / [i915#2575]) -> [SKIP][180] ([Intel XE#306])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#373]) -> [SKIP][182] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         [SKIP][183] ([Intel XE#373]) -> [SKIP][184] ([Intel XE#4950])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_chamelium_edid@dp-mode-timings.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#4208] / [i915#2575]) -> [SKIP][186] ([Intel XE#373]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208] / [i915#2575]) -> [FAIL][188] ([Intel XE#1178])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][189] ([Intel XE#1178]) -> [SKIP][190] ([Intel XE#4208] / [i915#2575])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_content_protection@legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][191] ([Intel XE#1178]) -> [SKIP][192] ([Intel XE#2341]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_content_protection@srm.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         [SKIP][193] ([Intel XE#455]) -> [SKIP][194] ([Intel XE#4950]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4208] / [i915#2575]) -> [SKIP][196] ([Intel XE#455]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [SKIP][198] ([Intel XE#308])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         [SKIP][199] ([Intel XE#309]) -> [SKIP][200] ([Intel XE#4950])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208]) -> [SKIP][202] ([Intel XE#4356])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#455]) -> [SKIP][204] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#776]) -> [SKIP][206] ([Intel XE#4208])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208] / [i915#2575]) -> [SKIP][208] ([Intel XE#1138])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-adlp:         [SKIP][209] ([Intel XE#310]) -> [SKIP][210] ([Intel XE#4950]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][212] ([Intel XE#4208] / [i915#2575])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][214] ([Intel XE#455]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#455]) -> [SKIP][216] ([Intel XE#4208]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#2311]) +21 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#651]) -> [SKIP][220] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][221] ([Intel XE#5390]) -> [SKIP][222] ([Intel XE#2312]) +11 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#5390]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][226] ([Intel XE#658])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][227] ([Intel XE#651]) -> [SKIP][228] ([Intel XE#4947]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][230] ([Intel XE#651]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][231] ([Intel XE#2311]) -> [SKIP][232] ([Intel XE#2312]) +20 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4208]) -> [SKIP][234] ([Intel XE#651]) +11 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#651]) -> [SKIP][236] ([Intel XE#4208]) +11 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][237] ([Intel XE#2312]) -> [SKIP][238] ([Intel XE#2313]) +21 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][239] ([Intel XE#656]) -> [SKIP][240] ([Intel XE#4947]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][241] ([Intel XE#2313]) -> [SKIP][242] ([Intel XE#2312]) +16 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#653]) -> [SKIP][244] ([Intel XE#4208]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         [SKIP][245] ([Intel XE#653]) -> [SKIP][246] ([Intel XE#4947])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#653]) -> [SKIP][248] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208]) -> [SKIP][250] ([Intel XE#653]) +15 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][252] ([Intel XE#653]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][253] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][254] ([Intel XE#3544])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#346]) -> [SKIP][256] ([Intel XE#4208])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4208]) -> [SKIP][258] ([Intel XE#2925])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2927]) -> [SKIP][260] ([Intel XE#4208])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#356]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][263] ([Intel XE#5021]) -> [SKIP][264] ([Intel XE#4596])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [SKIP][266] ([Intel XE#1129])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#4208]) -> [SKIP][268] ([Intel XE#1489]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1489]) -> [SKIP][270] ([Intel XE#4208]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#1122])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1122]) -> [SKIP][274] ([Intel XE#4208])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         [SKIP][275] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][276] ([Intel XE#4947]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_psr@fbc-pr-no-drrs.html
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][278] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][280] ([Intel XE#4208]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_psr@fbc-psr-primary-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4208] / [i915#2575]) -> [SKIP][284] ([Intel XE#3414]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208] / [i915#2575]) -> [SKIP][286] ([Intel XE#1127])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#455]) -> [SKIP][288] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-center.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1500]) -> [SKIP][290] ([Intel XE#362])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#455]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208]) -> [SKIP][294] ([Intel XE#1123])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         [SKIP][295] ([Intel XE#944]) -> [SKIP][296] ([Intel XE#4945])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_create@multigpu-create-massive-size.html
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#944]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208]) -> [SKIP][300] ([Intel XE#5419])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eu_stall@non-blocking-read.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#4837]) +7 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4837]) -> [SKIP][304] ([Intel XE#4208]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_eudebug@vma-ufence-faultable.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         [SKIP][305] ([Intel XE#4837]) -> [SKIP][306] ([Intel XE#4945])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_eudebug_online@single-step-one.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [SKIP][307] ([Intel XE#1392]) -> [SKIP][308] ([Intel XE#4945]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#1392]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#288]) -> [SKIP][312] ([Intel XE#4208]) +10 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208]) -> [SKIP][314] ([Intel XE#288]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([Intel XE#2360])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
    - shard-adlp:         [SKIP][317] ([Intel XE#2360]) -> [SKIP][318] ([Intel XE#4945])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][319] ([Intel XE#3876]) -> [SKIP][320] ([Intel XE#4208])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - shard-adlp:         [SKIP][321] ([Intel XE#4915]) -> [SKIP][322] ([Intel XE#4945]) +19 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4915]) -> [SKIP][324] ([Intel XE#4208]) +117 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208]) -> [SKIP][326] ([Intel XE#4915]) +153 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#255])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [SKIP][352], [PASS][353], [PASS][354]) ([Intel XE#378]) -> ([PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [DMESG-WARN][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [SKIP][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-4/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-4/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-4/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][382] ([Intel XE#4208]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208]) -> [SKIP][384] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][386] ([Intel XE#4208])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@xe_oa@syncs-userptr-wait.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4208]) -> [SKIP][388] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][389] ([Intel XE#977]) -> [SKIP][390] ([Intel XE#4945])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_pat@pat-index-xe2.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208]) -> [SKIP][392] ([Intel XE#977])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#4208]) -> [SKIP][394] ([Intel XE#979])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][395] ([Intel XE#1173]) -> [SKIP][396] ([Intel XE#1061])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_peer2peer@read.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1061]) -> [FAIL][398] ([Intel XE#1173])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_peer2peer@write.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][400] ([Intel XE#4208])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208]) -> [SKIP][402] ([Intel XE#579])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#4208]) -> [SKIP][404] ([Intel XE#4733])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#944]) -> [SKIP][406] ([Intel XE#4208]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4820
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -> xe-pw-151321v1

  IGT_8445: 8445
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b
  xe-pw-151321v1: 151321v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/index.html

--===============4630115551628661794==
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
<tr><td><b>Series:</b></td><td>Fair DRM scheduler</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151321/">https://patchwork.freedesktop.org/series/151321/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151321v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151321v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb589=
27eb50b_FULL -&gt; xe-pw-151321v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151321v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151321v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1513=
21v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_sequence@queue-idle@pipe-c-dp-4:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_sequence@queue-idle@pip=
e-c-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_se=
quence@queue-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/=
igt@kms_sequence@queue-idle.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1=
/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3368-8b32b5509128873da8ecfc06b=
eefcb58927eb50b_FULL and xe-pw-151321v1_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151321v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@fbdev@e=
of.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151321v1/shard-adlp-8/igt@fbdev@eof.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg=
2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-=
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
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-7/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4820">Intel XE#4820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cur=
sor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_cursor_=
legacy@cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_cur=
sor_legacy@single-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6/igt@kms_cursor_legacy@singl=
e-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip@blocking-wf_vblank=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-lnl-6/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-lnl-1/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_f=
lip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sha=
rd-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-ad=
lp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sha=
rd-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-5/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-8/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-di=
scovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec=
_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec=
_compute_mode@twice-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_compute_mo=
de@twice-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_sip_eudebug@wait-writ=
esip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-malloc-fork-read-after.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +19 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +161 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_mod=
ule_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_module_load@many-re=
load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151321v1/shard-bmg-4/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@fbdev@=
write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@fbdev@write.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151321v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-suspend.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-434/igt@kms_cursor_cr=
c@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-1/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +8 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fl=
ip@absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-4=
35/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +59 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@kms_fli=
p@flip-vs-modeset-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-2/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@kms_pm_=
rpm@i2c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@km=
s_pm_rpm@i2c.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bm=
g-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +113 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/=
igt@xe_exec_basic@multigpu-no-exec-rebind.html">PASS</a> +4 other tests pas=
s</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/62=
3">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big=
_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms=
_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_bi=
g_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms=
_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big=
_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151321v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/=
shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-43=
6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw=
@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1513=
21v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_ccs=
@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/=
shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321=
v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-4=
36/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shar=
d-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/=
shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/s=
hard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4=
418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_chame=
lium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ch=
amelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cha=
melium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_=
chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ch=
amelium_edid@vga-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
dg2-435/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_co=
ntent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shar=
d-dg2-432/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@km=
s_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/s=
hard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_fli=
p@2x-flip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@kms_flip@2x-fl=
ip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151321v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151321v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt=
@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151321v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51321v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/s=
hard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#65=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151321v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151321v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151321v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1513=
21v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
321v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151321v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndsc=
rn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg=
2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ps=
r2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-=
dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ps=
r2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/=
igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@kms_=
psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_psr=
@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@km=
s_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ps=
r@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/=
igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ps=
r@fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-=
436/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@kms=
_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-4=
32/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51321v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_sc=
aling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt=
@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt-many-all-ram.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard=
-dg2-432/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_crea=
te@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@=
xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_cre=
ate@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/=
igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eu_=
stall@non-blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_eu=
_stall@non-blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_eud=
ebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@xe_=
eudebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_eude=
bug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_=
eudebug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">I=
ntel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151321v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1321v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userp=
tr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321=
v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefe=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/=
shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2=
360</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec=
_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adl=
p-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exe=
c_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/=
igt@xe_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec=
_system_allocator@many-large-mmap-file-mlock.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sh=
ard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945=
">Intel XE#4945</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_exe=
c_system_allocator@process-many-large-execqueues-mmap-nomemset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">In=
tel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151321v1/shard-dg2-436/igt@xe_exec_system_allocator@process-many-lar=
ge-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +117 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-=
many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1=
53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_huc_copy@hu=
c_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50=
b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb5892=
7eb50b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefc=
b58927eb50b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06=
beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8e=
cfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b550912887=
3da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509=
128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32=
b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368=
-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50=
b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb5892=
7eb50b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefc=
b58927eb50b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06=
beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8e=
cfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b550912887=
3da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151321v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1513=
21v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151321v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-a=
dlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151321v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15132=
1v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151321v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151321v1/shard-adlp-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151321v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151321v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151321v1/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_oa@=
closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/sha=
rd-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@=
privileged-forked-access-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/=
igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3=
573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@xe_oa@=
syncs-userptr-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/=
shard-dg2-436/igt@xe_oa@syncs-userptr-wait.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-435/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_pat@=
pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-adlp-8/igt@xe_pat@pat-index-x=
e2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-466/igt@xe_pat@pat-ind=
ex-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-433/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-432/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pxp=
@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-d=
g2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE=
#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151321v1/shard-dg2-436=
/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -&gt; xe-pw-151=
321v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc0=
6beefcb58927eb50b<br />
  xe-pw-151321v1: 151321v1</p>

</body>
</html>

--===============4630115551628661794==--
