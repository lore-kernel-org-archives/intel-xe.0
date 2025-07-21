Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B7BC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 07:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FCF10E25C;
	Mon, 21 Jul 2025 07:13:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB2A10E256;
 Mon, 21 Jul 2025 07:13:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3911269529988747169=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_adl_auxcss_ci_run_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Jul 2025 07:13:30 -0000
Message-ID: <175308201029.176517.5306729534376935829@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
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

--===============3911269529988747169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: adl auxcss ci run (rev3)
URL   : https://patchwork.freedesktop.org/series/151753/
State : failure

== Summary ==

CI Bug Log - changes from xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e_FULL -> xe-pw-151753v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151753v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151753v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151753v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +118 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][3] +8 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][8] ([Intel XE#4543]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][10] ([Intel XE#1948]) -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html

  
New tests
---------

  New tests have been introduced between xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e_FULL and xe-pw-151753v3_FULL:

### New IGT tests (44) ###

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  

Known issues
------------

  Here are the changes found in xe-pw-151753v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][12] ([Intel XE#4543]) +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#4543]) +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html

  * igt@kms_async_flips@crc@pipe-a-dp-2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#3884]) +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-a-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-dp-2.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][17] -> [FAIL][18] ([Intel XE#4677])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#4626]) +8 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#607])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +139 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#307])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#1475])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4294])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2316]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#2049] / [Intel XE#2597])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#3106]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5390])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#653]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][54] -> [ABORT][55] ([Intel XE#2953]) +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#616]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#4689]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#4459]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4837]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#1392]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#288]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#3876])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4915]) +34 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3876])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4733])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#944])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@shared-pde3-page:
    - shard-adlp:         [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#3876])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_vm@shared-pde3-page.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_vm@shared-pde3-page.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][77] ([Intel XE#827]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][79] ([Intel XE#911]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         [SKIP][81] ([Intel XE#787]) -> [PASS][82] +84 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][83] ([Intel XE#455] / [Intel XE#787]) -> [PASS][84] +56 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][85] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][87] ([Intel XE#3124]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [FAIL][91] ([Intel XE#3098]) -> [PASS][92] +2 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#4543]) -> [PASS][94] +2 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][95] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][96] +5 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [SKIP][97] ([Intel XE#455]) -> [PASS][98] +7 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#455]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][101] ([Intel XE#1503]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-adlp:         [FAIL][103] ([Intel XE#5195]) -> [PASS][104] +4 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][105] ([Intel XE#1874]) -> [PASS][106] +2 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][107] ([Intel XE#3428]) -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1392]) -> [PASS][110] +5 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-userptr:
    - shard-bmg:          [FAIL][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@xe_exec_compute_mode@twice-userptr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@xe_exec_compute_mode@twice-userptr.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][113] ([Intel XE#5018]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         [SKIP][115] ([Intel XE#1125]) -> [SKIP][116] ([Intel XE#1125] / [Intel XE#5574]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@intel_hwmon@hwmon-write.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][117] ([Intel XE#455] / [Intel XE#787]) -> [DMESG-WARN][118] ([Intel XE#2953] / [Intel XE#4173])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][119] ([Intel XE#787]) -> [DMESG-WARN][120] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][121] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-WARN][122] ([Intel XE#5208])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][123] ([Intel XE#2312]) -> [SKIP][124] ([Intel XE#2311])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2311]) -> [SKIP][126] ([Intel XE#2312]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][127] ([Intel XE#5390]) -> [SKIP][128] ([Intel XE#2312]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#2313]) -> [SKIP][130] ([Intel XE#2312]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][131] ([Intel XE#2312]) -> [SKIP][132] ([Intel XE#2313])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         [SKIP][133] ([Intel XE#1122]) -> [SKIP][134] ([Intel XE#1122] / [Intel XE#5580]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         [SKIP][135] ([Intel XE#2939]) -> [SKIP][136] ([Intel XE#2939] / [Intel XE#5585])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][137] ([Intel XE#1392]) -> [SKIP][138] ([Intel XE#1392] / [Intel XE#5575]) +51 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         [SKIP][139] ([Intel XE#2360]) -> [SKIP][140] ([Intel XE#2360] / [Intel XE#5573]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         [SKIP][141] ([Intel XE#2229]) -> [SKIP][142] ([Intel XE#2229] / [Intel XE#5488])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - shard-adlp:         [SKIP][143] ([Intel XE#1008]) -> [SKIP][144] ([Intel XE#1008] / [Intel XE#5591])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@xe_mmap@vram.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         [SKIP][145] ([Intel XE#1337]) -> [SKIP][146] ([Intel XE#1337] / [Intel XE#5572])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#1173]) -> [SKIP][148] ([Intel XE#1061])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-464/igt@xe_peer2peer@read.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         [SKIP][149] ([Intel XE#4733]) -> [SKIP][150] ([Intel XE#4733] / [Intel XE#5594]) +13 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5572]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572
  [Intel XE#5573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e -> xe-pw-151753v3

  IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e: f680f6d0a532122a3b57909c69613bce1c2f1b2e
  xe-pw-151753v3: 151753v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/index.html

--===============3911269529988747169==
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
<tr><td><b>Series:</b></td><td>adl auxcss ci run (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151753/">https://patchwork.freedesktop.org/series/151753/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e_FULL -&gt; xe-pw-151753v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151753v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151753v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151753v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">FAIL</a> +118 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e_FULL and xe-pw-151753v3_FULL:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151753v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677">Intel XE#4677</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde3-page:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_vm@shared-pde3-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@xe_vm@shared-pde3-page.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_hdr@static-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@kms_plane@pixel-format@pipe-b-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@xe_exec_compute_mode@twice-userptr.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-3/igt@xe_exec_compute_mode@twice-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574">Intel XE#5574</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573">Intel XE#5573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572">Intel XE#5572</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-dg2-464/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151753v3/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e -&gt; xe-pw-151753v3</li>
</ul>
<p>IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e: f680f6d0a532122a3b57909c69613bce1c2f1b2e<br />
  xe-pw-151753v3: 151753v3</p>

</body>
</html>

--===============3911269529988747169==--
