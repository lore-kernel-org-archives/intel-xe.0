Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AA6C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 10:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3EE10E6FA;
	Tue, 20 Aug 2024 10:32:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A710110E6FA;
 Tue, 20 Aug 2024 10:32:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8409851173466480095=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Add_GuC_based_reg?=
 =?utf-8?q?ister_capture_for_error_capture_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 10:32:54 -0000
Message-ID: <172414997466.698595.3136715792540917950@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
In-Reply-To: <20240820021142.436536-1-zhanjun.dong@intel.com>
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

--===============8409851173466480095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev16)
URL   : https://patchwork.freedesktop.org/series/128077/
State : failure

== Summary ==

CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e_full -> xe-pw-128077v16_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128077v16_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128077v16_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128077v16_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_debugfs@gt:
    - shard-dg2-set2:     [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_debugfs@gt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_debugfs@gt.html
    - shard-lnl:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@xe_debugfs@gt.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@xe_debugfs@gt.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-dg2-set2:     [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_vm@large-split-misaligned-binds-33554432.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_vm@large-split-misaligned-binds-33554432.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-bmg}:        NOTRUN -> ([FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-6/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-4/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-7/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-5/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-6/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-1/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-7/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-4/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-5/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-6/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-8/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-8/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-3/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-4/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-1/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-8/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-7/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-3/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-5/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-3/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-128077v16_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1705])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#1426]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#607]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#1659])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#1204]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1874]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#1231]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1399])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-adlp:         [PASS][59] -> [SKIP][60] ([Intel XE#1201]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2028]) +9 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#323])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-lnl:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#877]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#324]) +3 other tests dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1874]) +9 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [FAIL][75] ([Intel XE#1861]) +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1151] / [Intel XE#1201])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#656]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-4:
    - shard-lnl:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#324])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2318]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#870]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_pm_backlight@fade-with-dpms.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#1430])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [PASS][92] -> [FAIL][93] ([Intel XE#718])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [PASS][94] -> [INCOMPLETE][95] ([Intel XE#1195])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_properties@crtc-properties-atomic.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1406]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#327])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][100] -> [FAIL][101] ([Intel XE#899])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][102] -> [FAIL][103] ([Intel XE#899])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#2443]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_vrr@flip-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][107] -> [TIMEOUT][108] ([Intel XE#1473]) +1 other test timeout
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-adlp:         [PASS][111] -> [DMESG-WARN][112] ([Intel XE#1727] / [Intel XE#2226])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1392])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#1069])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#2249])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][123] ([Intel XE#2249])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#977])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#2284])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][126] -> [DMESG-WARN][127] ([Intel XE#1551] / [Intel XE#569])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][128] -> [ABORT][129] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][130] -> [ABORT][131] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][132] -> [DMESG-WARN][133] ([Intel XE#2019])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][134] -> [FAIL][135] ([Intel XE#1081])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@large-userptr-binds-2147483648:
    - shard-adlp:         [PASS][136] -> [DMESG-WARN][137] ([Intel XE#2226]) +7 other tests dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_vm@large-userptr-binds-2147483648.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@xe_vm@large-userptr-binds-2147483648.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-lnl:          [FAIL][138] ([Intel XE#2452]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@core_getversion@all-cards.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@core_getversion@all-cards.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][140] ([Intel XE#1426]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][142] ([Intel XE#1426]) -> [PASS][143] +5 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][144] ([Intel XE#2351]) -> [PASS][145] +8 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#324]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][148] ([Intel XE#1541]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@busy-flip:
    - shard-lnl:          [SKIP][150] ([Intel XE#2423]) -> [PASS][151] +10 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@busy-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][152] ([Intel XE#886]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][154] ([Intel XE#1861]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1162]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [FAIL][158] ([Intel XE#2028]) -> [PASS][159] +11 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][160] ([Intel XE#324]) -> [PASS][161] +8 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][162] ([Intel XE#1874]) -> [PASS][163] +2 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][164] ([Intel XE#361]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][166] ([Intel XE#718]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [SKIP][168] ([Intel XE#1201]) -> [PASS][169] +4 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pm_rpm@i2c.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [SKIP][170] ([Intel XE#2446]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][172] ([Intel XE#899]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][174] ([Intel XE#899]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][176] ([Intel XE#899]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#1551]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [FAIL][180] -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_vrr@flip-dpms.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-lnl:          [FAIL][182] ([Intel XE#2443]) -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][184] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][186] ([Intel XE#1473]) -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
    - shard-adlp:         [FAIL][188] ([Intel XE#1069]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-lnl:          [DMESG-WARN][190] ([Intel XE#1638]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_exec_basic@many-basic-defer-bind.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         [TIMEOUT][192] -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][194] ([Intel XE#2125]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][196] ([Intel XE#358]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_reset@cat-error.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_store@basic-all:
    - shard-lnl:          [SKIP][198] ([Intel XE#1130]) -> [PASS][199] +27 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_exec_store@basic-all.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_exec_store@basic-all.html

  * igt@xe_exec_threads@threads-rebind:
    - shard-adlp:         [INCOMPLETE][200] ([Intel XE#1169] / [Intel XE#1195]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec_threads@threads-rebind.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@xe_exec_threads@threads-rebind.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [INCOMPLETE][202] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#2019]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_module_load@reload.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][206] ([Intel XE#2514]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][208] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [ABORT][210] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][212] ([Intel XE#1794]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - shard-adlp:         [DMESG-WARN][214] ([Intel XE#2226]) -> [PASS][215] +10 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_prime_self_import@basic-with_one_bo.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#801]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#316]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#316])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][221] ([Intel XE#316]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          [SKIP][222] ([Intel XE#2351]) -> [SKIP][223] ([Intel XE#1407])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1124]) -> [SKIP][225] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#607]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#607])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1124]) +9 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][230] ([Intel XE#2351]) -> [SKIP][231] ([Intel XE#1124]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][233] ([Intel XE#367]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#367]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         [SKIP][236] ([Intel XE#1201]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#367])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1252]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][240] ([Intel XE#2351]) -> [SKIP][241] ([Intel XE#1399]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][245] ([Intel XE#787]) +83 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-adlp:         [SKIP][246] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][247] ([Intel XE#1201]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#787]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][250] ([Intel XE#1201]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][253] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][255] ([Intel XE#1252]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][256] ([Intel XE#2351]) -> [SKIP][257] ([Intel XE#314])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          [SKIP][258] ([Intel XE#2423]) -> [SKIP][259] ([Intel XE#373]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][261] ([Intel XE#373]) +6 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#373]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][265] ([Intel XE#307])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][266] ([Intel XE#2423]) -> [SKIP][267] ([Intel XE#1413])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          [SKIP][268] ([Intel XE#2423]) -> [SKIP][269] ([Intel XE#1424])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#703]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#703])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1137]) -> [SKIP][273] ([Intel XE#1137] / [Intel XE#1201])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          [SKIP][274] ([Intel XE#2423]) -> [SKIP][275] ([Intel XE#1421]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][277] ([Intel XE#455]) +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][278] ([Intel XE#2351]) -> [SKIP][279] ([Intel XE#651]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][280] ([Intel XE#1201]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][282] ([Intel XE#2351]) -> [SKIP][283] ([Intel XE#656]) +7 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][285] ([Intel XE#651]) +23 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][286] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][287] ([Intel XE#1201])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#651]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         [FAIL][290] -> [SKIP][291] ([Intel XE#1201] / [Intel XE#651])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#653]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#653]) +26 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][294] ([Intel XE#1201]) -> [SKIP][295] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][296] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][297] ([Intel XE#1201])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][298] ([Intel XE#1201]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][301] ([Intel XE#653]) +25 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][303] ([Intel XE#417])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#1470])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#455]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][308] ([Intel XE#1450] / [Intel XE#599]) -> [SKIP][309] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_invalid_mode@clock-too-high.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#356]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#356])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [SKIP][312] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][315] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#498]) -> [SKIP][317] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][319] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][321] ([Intel XE#2318]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-lnl:          [SKIP][322] ([Intel XE#2423]) -> [SKIP][323] ([Intel XE#2318])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2318]) -> [SKIP][325] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][328] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][331] ([Intel XE#870])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#870]) -> [SKIP][333] ([Intel XE#1201] / [Intel XE#870])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][335] ([Intel XE#1489]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1489]) -> [SKIP][337] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#1122]) -> [SKIP][339] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][341] ([Intel XE#929]) +14 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          [SKIP][342] ([Intel XE#2351]) -> [SKIP][343] ([Intel XE#1406])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_psr@pr-primary-render.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#929]) -> [SKIP][345] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1149]) -> [SKIP][347] ([Intel XE#1149] / [Intel XE#1201])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#327]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#327])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][351] ([Intel XE#327]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         [SKIP][352] ([Intel XE#1201]) -> [SKIP][353] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][355] ([Intel XE#1729])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][357] ([Intel XE#2168])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_vrr@cmrr.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][359] ([Intel XE#756]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][361] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][363] ([Intel XE#1126])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][364] ([Intel XE#1473]) -> [TIMEOUT][365] ([Intel XE#1041] / [Intel XE#1473])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][367] ([Intel XE#288]) +18 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#288]) -> [SKIP][369] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][371] ([Intel XE#2360])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][372] ([Intel XE#2105]) -> [INCOMPLETE][373] ([Intel XE#1195] / [Intel XE#2105])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][374] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455]) -> [SKIP][375] ([Intel XE#1192] / [Intel XE#1201])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][377] ([Intel XE#512])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_mmap@small-bar.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][379] ([Intel XE#2541]) +4 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2541]) -> [SKIP][381] ([Intel XE#1201] / [Intel XE#2541]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#979]) -> [SKIP][383] ([Intel XE#1201] / [Intel XE#979])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][385] ([Intel XE#2284] / [Intel XE#366])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][386] ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569]) -> [DMESG-WARN][387] ([Intel XE#1162] / [Intel XE#569])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][389] ([Intel XE#944]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          [SKIP][390] ([Intel XE#1130]) -> [SKIP][391] ([Intel XE#944])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#944]) -> [SKIP][393] ([Intel XE#1201] / [Intel XE#944])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7976 -> IGT_7978
  * Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -> xe-pw-128077v16

  IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7bb6237a94ee46cc76e
  xe-pw-128077v16: 128077v16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/index.html

--===============8409851173466480095==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add GuC based register capture f=
or error capture (rev16)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/128077/">https://patchwork.freedesktop.org/series/128077/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-128077v16/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-128077v16/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1798-4d24271792fac837e728f7bb6237a94ee=
46cc76e_full -&gt; xe-pw-128077v16_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128077v16_full absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-128077v16_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1280=
77v16_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_pm_b=
acklight@fade-with-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_pm_backlight@=
fade-with-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_r=
otation_crc@primary-4-tiled-reflect-x-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_deb=
ugfs@gt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_debugfs@gt.html">ABORT</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@xe_debug=
fs@gt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-128077v16/shard-lnl-8/igt@xe_debugfs@gt.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-4/igt@xe_pm@s2=
idle-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@xe_pm@s2idle-multiple-ex=
ecs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_vm@=
large-split-misaligned-binds-33554432.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_v=
m@large-split-misaligned-binds-33554432.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-bmg}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-4/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12807=
7v16/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-5/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-128077v16/shard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-1/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-128077v16/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-128077v16/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-=
bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-8/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16=
/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12=
8077v16/shard-bmg-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-128077v16/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-8/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-128077v16/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-128077v16/shard-bmg-3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard=
-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-2/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v1=
6/shard-bmg-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-bmg-1/igt@runner@aborted.h=
tml">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128077v16_full that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_as=
ync_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt=
@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#=
1705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128=
077v16/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-f=
encing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/i=
gt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE=
#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-=
adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/=
shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-as=
ync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 =
other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-t=
iled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_ccs@crc-primary-rotatio=
n-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_cursor_crc=
@cursor-random-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_cursor_crc@cursor-slidi=
ng-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_curso=
r_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +9 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_curs=
or_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_cursor_legac=
y@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscali=
ng.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adl=
p-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"=
>Intel XE#1874</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_frontbuffer_tracking@dr=
rs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_frontbuffer_tracking@fb=
c-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1151">Intel XE#1151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_plan=
e@plane-position-hole@pipe-b-plane-4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_pla=
ne@plane-position-hole@pipe-b-plane-4.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_plane_scaling@2x-scaler=
-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"=
>Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"=
>Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-=
hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"=
>Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_pm_b=
acklight@fade-with-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@kms_pm_backlight@fad=
e-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Int=
el XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_pro=
perties@crtc-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_properti=
es@crtc-properties-atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_psr2_sf@fbc-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_=
universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432=
/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#8=
99</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@kms_vrr@=
flip-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Inte=
l XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@xe_ccs@block-multicopy-inpl=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evi=
ct@evict-mixed-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_evict@evic=
t-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_evict@evict-threads-smal=
l-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_evict_ccs@evict-overcomm=
it-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_exec=
_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt=
@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/igt@xe_exec_basic@multigpu-no-e=
xec-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_exec_basic@multigpu-once-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@xe_exec_=
compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shar=
d-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_liv=
e_ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@xe_live_ktest@xe_migrat=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@xe_oa@create-destroy-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_oa@mm=
io-triggered-reports.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@xe_oa@mmio-triggered-re=
ports.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@xe_oa@mmio-triggered-reports=
@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pm@=
s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-e=
xec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1551">Intel XE#1551</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"=
>Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_pm@=
s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefe=
tch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@xe_spin=
_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-9/igt@x=
e_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_vm@l=
arge-userptr-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/igt@xe_vm@large-u=
serptr-binds-2147483648.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +7 other tests d=
mesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@core_get=
version@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2452">Intel XE#2452</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@core_getvers=
ion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1426">Intel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-128077v16/shard-lnl-3/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_at=
omic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">I=
ntel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-128077v16/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-mode=
set-transition@pipe-a-hdmi-a-6.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/i=
gt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +8 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-128077v16/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_curs=
or_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#15=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12=
8077v16/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-t=
ransitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip=
@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_flip@busy-flip.=
html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_flip=
@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/i=
gt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#=
1861</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
128077v16/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-=
433/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-1/igt@kms_pipe=
_crc_basic@suspend-read-crc@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard=
-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> =
+11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-5/igt@kms_plan=
e@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/=
shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PAS=
S</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_pla=
ne_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-=
1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/s=
hard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_pm_rpm@i2c.html">=
PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-4/igt@k=
ms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-ln=
l-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-2/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shar=
d-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_vb=
lank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1280=
77v16/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_vrr@=
flip-dpms.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_vrr@flip-dpms.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@kms_vrr@=
flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_vrr=
@flip-dpms@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_evi=
ct@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#4=
02</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12=
8077v16/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_evi=
ct@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2=
-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec=
_balancer@many-execqueues-cm-parallel-basic.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-basic.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-3/igt@xe_exec_=
basic@many-basic-defer-bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-3/=
igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec=
_basic@many-execqueues-many-vm-basic-defer-mmap.html">TIMEOUT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adl=
p-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec=
_compute_mode@lr-mode-workload.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2125">Intel XE#2125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-8/=
igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec=
_reset@cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@xe_exec_=
reset@cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_exec_=
store@basic-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_exec_store@=
basic-all.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_exec=
_threads@threads-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-adlp-4/igt@xe_exec_threads@threads-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_gt_fr=
eq@freq_reset_multiple.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_mod=
ule_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@xe_mod=
ule_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-7/igt@xe_oa@oa=
-regs-whitelisted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_oa@oa-reg=
s-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s=
4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-2/igt@x=
e_pm@s4-exec-after.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/igt@xe_=
pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-6/igt@xe_pm@s4-v=
m-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@xe_prim=
e_self_import@basic-with_one_bo.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-ad=
lp-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +10 other te=
sts pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/801=
">Intel XE#801</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-=
flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</=
a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@=
kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard=
-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms=
_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/ig=
t@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg=
2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
07">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-2/igt@kms=
_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-128077v16/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-19=
20x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/s=
hard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_bw@=
linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp=
-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_cc=
s@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-=
433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"=
>Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399"=
>Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-1/igt@kms_ccs=
@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-128077v16/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
128077v16/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp=
-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-128077v16/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v1=
6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel=
 XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-6/igt@=
kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_cham=
elium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard=
-lnl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel =
XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_ch=
amelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/s=
hard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#3=
73</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_chamel=
ium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/i=
gt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_curs=
or_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-5/i=
gt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms=
_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt@kms_f=
eature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_flip=
@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1280=
77v16/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1280=
77v16/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msfl=
ip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128=
077v16/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-=
draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-128077v16/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-128077v16/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn=
-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
28077v16/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12=
8077v16/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-128077v16/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-prim=
scrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shar=
d-adlp-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
28077v16/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_hd=
mi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-4=
32/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_hdmi_=
inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_hdr@invalid-=
hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-2/igt@kms_inva=
lid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-=
7/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">=
Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-d=
g2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-128077v16/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-f=
actor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#49=
8</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
98">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-f=
actor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#49=
8</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/498">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-128077v16/shard-dg2-433/igt@kms_plane_scaling@plane-downsca=
le-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Int=
el XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
18">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_plane_scaling@=
planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel =
XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-l=
nl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#=
2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel =
XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_plane_scaling@pl=
anes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_pla=
ne_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-128077v16/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20=
-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg=
2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@kms_=
pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-=
continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ps=
r2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/s=
hard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-435/igt@kms_psr=
2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard=
-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@kms_psr@=
pr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-1/igt@kms_psr@pr-p=
rimary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@kms_psr@psr-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/=
shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
149">Intel XE#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-d=
g2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-4/igt@kms_sca=
ling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-adlp-4/=
igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sha=
rd-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@kms_vrr=
@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-433/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/=
shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/sh=
ard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_evi=
ct@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/s=
hard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">=
Intel XE#1041</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1280=
77v16/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
88">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-=
433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">=
Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Inte=
l XE#2360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-128077v16/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted=
-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-466/igt@xe_exe=
c_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-463/igt=
@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#210=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-adlp-8/igt@xe_live=
_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-a=
dlp-8/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-434/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-432/igt@xe_m=
map@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_oa@=
mmio-triggered-reports.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2=
-432/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_oa@=
oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-466/igt@xe_oa@oa-t=
lb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-434/igt@xe_pat@pat-in=
dex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-463/igt@xe_pm@=
d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077=
v16/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_pm@=
s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#5=
69</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12=
8077v16/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel=
 XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-435/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077=
v16/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-lnl-8/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-lnl-7/=
igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e/shard-dg2-432/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v16/shard-dg2-43=
4/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7976 -&gt; IGT_7978</li>
<li>Linux: xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e -&gt; xe-pw-128=
077v16</li>
</ul>
<p>IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1798-4d24271792fac837e728f7bb6237a94ee46cc76e: 4d24271792fac837e728f7b=
b6237a94ee46cc76e<br />
  xe-pw-128077v16: 128077v16</p>

</body>
</html>

--===============8409851173466480095==--
