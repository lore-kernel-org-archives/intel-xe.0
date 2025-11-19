Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2631CCF258C
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 08:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F0510E5A8;
	Wed, 19 Nov 2025 08:35:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D5410E352;
 Wed, 19 Nov 2025 08:35:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8087649599706792961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_change?=
 =?utf-8?q?_pipe_order_for_platforms_with_big_joiner_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 08:35:34 -0000
Message-ID: <176354133434.8491.16550941085382141516@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118095801.2248786-1-jani.nikula@intel.com>
In-Reply-To: <20251118095801.2248786-1-jani.nikula@intel.com>
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

--===============8087649599706792961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: change pipe order for platforms with big joiner (rev2)
URL   : https://patchwork.freedesktop.org/series/157703/
State : failure

== Summary ==

CI Bug Log - changes from xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c_FULL -> xe-pw-157703v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157703v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157703v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157703v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][1] +47 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +59 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] +139 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-432/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][9] -> [SKIP][10] +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [FAIL][12] +145 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1.html

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][13] -> [FAIL][14] +219 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-3.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] +283 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html

  
#### Warnings ####

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         [FAIL][17] ([Intel XE#5195]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [SKIP][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44]) ([Intel XE#378]) -> ([DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53], [DMESG-WARN][54], [DMESG-WARN][55], [DMESG-WARN][56], [DMESG-WARN][57], [DMESG-WARN][58], [DMESG-WARN][59], [DMESG-WARN][60], [DMESG-WARN][61], [DMESG-WARN][62], [DMESG-WARN][63], [DMESG-WARN][64], [DMESG-WARN][65], [DMESG-WARN][66], [DMESG-WARN][67], [DMESG-WARN][68], [DMESG-WARN][69])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-1/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-2/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-7/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-7/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-7/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-8/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-8/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c_FULL and xe-pw-157703v2_FULL:

### New IGT tests (17) ###

  * igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6-pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_setmode@basic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_setmode@basic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_setmode@basic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_setmode@basic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_setmode@basic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_setmode@basic@pipe-c-hdmi-a-6-pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-a-hdmi-a-6-pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-c-hdmi-a-6-pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-dp-2-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-hdmi-a-6-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-c-dp-2-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-c-hdmi-a-6-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  

Known issues
------------

  Here are the changes found in xe-pw-157703v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#3718] / [Intel XE#6078])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#6078])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2370])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2327]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1124]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#4543]) +2 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#607])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1124]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#2314] / [Intel XE#2894])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2314] / [Intel XE#2894])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#367])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#787]) +41 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2887]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][92] -> [INCOMPLETE][93] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#306])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#373])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2252]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2341])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#1178]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#308])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2320])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2321]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#2291]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2291])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][107] ([Intel XE#4633])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][108] -> [FAIL][109] ([Intel XE#4633])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1508])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2372])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#6578])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2316]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][115] -> [SKIP][116] ([Intel XE#2316]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][117] -> [INCOMPLETE][118] ([Intel XE#2049] / [Intel XE#2597])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][119] -> [DMESG-WARN][120] ([Intel XE#4543]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2293]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#455]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2311]) +14 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4141]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#651]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#653]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2313]) +15 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2312]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2350])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2501])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4359])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-position-hole:
    - shard-dg2-set2:     [PASS][133] -> [INCOMPLETE][134] ([Intel XE#1035]) +1 other test incomplete
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-435/igt@kms_plane@plane-position-hole.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-435/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-adlp:         [PASS][135] -> [INCOMPLETE][136] ([Intel XE#1035]) +2 other tests incomplete
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@kms_plane@plane-position-hole-dpms.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-9/igt@kms_plane@plane-position-hole-dpms.html
    - shard-bmg:          [PASS][137] -> [INCOMPLETE][138] ([Intel XE#1035]) +2 other tests incomplete
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-7/igt@kms_plane@plane-position-hole-dpms.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_cursor@primary:
    - shard-adlp:         [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#2953] / [Intel XE#4173])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-2/igt@kms_plane_cursor@primary.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-3/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4596])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1406] / [Intel XE#1489])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2330])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2413]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#6503])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][150] -> [INCOMPLETE][151] ([Intel XE#4488]) +1 other test incomplete
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1499])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2504])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#4837]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#4837])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2322]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#288]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#4943]) +18 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#4915]) +73 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][160] -> [DMESG-WARN][161] ([Intel XE#5893])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#3573]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][163] ([Intel XE#2594])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2284] / [Intel XE#366])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2284]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2284])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#4733])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#944]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4130])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][170] ([Intel XE#3908]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168] / [i915#14968]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][176] ([Intel XE#2291]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][178] ([Intel XE#2316]) -> [PASS][179] +3 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [DMESG-WARN][180] ([Intel XE#4543]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][182] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#6321] / [Intel XE#6606]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@once-null-defer-mmap:
    - shard-bmg:          [INCOMPLETE][186] ([Intel XE#2594]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-2/igt@xe_exec_basic@once-null-defer-mmap.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@xe_exec_basic@once-null-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:
    - shard-bmg:          [WARN][188] ([Intel XE#5786]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][190] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][194] ([Intel XE#1178]) -> [SKIP][195] ([Intel XE#2341])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [INCOMPLETE][196] -> [SKIP][197] ([Intel XE#2316])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#2311]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][200] ([Intel XE#2312]) -> [SKIP][201] ([Intel XE#4141]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][202] ([Intel XE#4141]) -> [SKIP][203] ([Intel XE#2312]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][204] ([Intel XE#2311]) -> [SKIP][205] ([Intel XE#2312]) +11 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#2312]) +10 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][210] ([Intel XE#5021]) -> [SKIP][211] ([Intel XE#4596])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][212] ([Intel XE#4596]) -> [SKIP][213] ([Intel XE#5021])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6578
  [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c -> xe-pw-157703v2

  IGT_8631: 8631
  xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c: 27427255cc2b36b2612a868bf937d576d15e8c9c
  xe-pw-157703v2: 157703v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/index.html

--===============8087649599706792961==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: change pipe order for plat=
forms with big joiner (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157703/">https://patchwork.freedesktop.org/series/157703/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157703v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157703v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4123-27427255cc2b36b2612a868bf937d576d=
15e8c9c_FULL -&gt; xe-pw-157703v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157703v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157703v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1577=
03v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a> +47 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-v=
s-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-436/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-=
dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-5/igt@kms_flip=
_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/sha=
rd-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-=
ccs.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-432/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg=
2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-to-linear.html">=
SKIP</a> +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">SKIP=
</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-2/igt@kms_pip=
e_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/sh=
ard-adlp-3/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdm=
i-a-1.html">FAIL</a> +145 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_rmfb=
@close-fd@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@kms_rmfb@close-fd@p=
ipe-b-hdmi-a-3.html">FAIL</a> +219 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-435/igt@kms_ro=
tation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_rotation=
_crc@sprite-rotation-180.html">FAIL</a> +283 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_pla=
ne@pixel-format-source-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/=
shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html=
">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e=
8c9c/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576=
d15e8c9c/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937=
d576d15e8c9c/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868b=
f937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a=
868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2=
612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b=
36b2612a868bf937d576d15e8c9c/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-27427255=
cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-2742=
7255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4123-=
27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-4/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9=
c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl=
-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-=
lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-157703v2/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/sha=
rd-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-157703v2/shard-lnl-5/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/=
shard-lnl-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-3/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157703v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703=
v2/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-lnl-2/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157=
703v2/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157703v2/shard-lnl-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-4/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157703v2/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-8=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-157703v2/shard-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a>)</=
li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4123-27427255cc2b36b2612a868bf=
937d576d15e8c9c_FULL and xe-pw-157703v2_FULL:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6-pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-hdmi-a-6-pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-a-hdmi-a-6-pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-c-hdmi-a-6-pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-dp-2-hdmi-a-3:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-hdmi-a-6-dp-4:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc@pipe-c-dp-2-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc@pipe-c-hdmi-a-6-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157703v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#=
6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-9/igt@kms_ato=
mic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/s=
hard-adlp-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-h=
dmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adl=
p-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-436/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms=
_flip@2x-dpms-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6578">Intel XE#6578</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_flip@2x-flip-=
vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_flip@flip-vs-s=
uspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-8/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-435/igt@kms_pl=
ane@plane-position-hole.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-435/igt@kms_plane@plane-pos=
ition-hole.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@kms_pla=
ne@plane-position-hole-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-adlp-9/igt@kms_plane@plane-=
position-hole-dpms.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +2 other tests incomp=
lete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-7/igt@kms_plan=
e@plane-position-hole-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_plane@plane-po=
sition-hole-dpms.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +2 other tests incomple=
te</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-2/igt@kms_pla=
ne_cursor@primary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-157703v2/shard-adlp-3/igt@kms_plane_cursor@primary.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-466/igt@kms_vblank@ts-=
continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-=
many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_eudebug_online@breakpoin=
t-many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_exec_fault_mode@once-use=
rptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-malloc-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +7=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-434/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-4=
66/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-4/igt@xe_pm@d3cold-basic.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2594">Intel XE#2594</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157703v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@=
fair-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-4/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157703v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6168">Intel XE#6168</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14968">i915#14968</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2-434/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157703v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-=
bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v=
2/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1577=
03v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606">Intel XE=
#6606</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157703v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-2/igt@xe_exec_=
basic@once-null-defer-mmap.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-5/ig=
t@xe_exec_basic@once-null-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-many-stride-mmap-prefetch.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1577=
03v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-pref=
etch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-adlp-8/igt@xe_pm@s=
2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE=
#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157703v2/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-=
6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57703v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157703v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157703v2/shard-bmg-1/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c -&gt; xe-pw-157=
703v2</li>
</ul>
<p>IGT_8631: 8631<br />
  xe-4123-27427255cc2b36b2612a868bf937d576d15e8c9c: 27427255cc2b36b2612a868=
bf937d576d15e8c9c<br />
  xe-pw-157703v2: 157703v2</p>

</body>
</html>

--===============8087649599706792961==--
