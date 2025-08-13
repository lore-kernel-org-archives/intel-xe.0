Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0BEC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 14:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF8710E752;
	Wed, 13 Aug 2025 14:26:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98B410E739;
 Wed, 13 Aug 2025 14:25:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7796496477154132708=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Driver-managed_exhaustive_?=
 =?utf-8?q?eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 14:25:58 -0000
Message-ID: <175509515887.233544.3557726318298982764@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

--===============7796496477154132708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Driver-managed exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/152882/
State : failure

== Summary ==

CI Bug Log - changes from xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13_FULL -> xe-pw-152882v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152882v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152882v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152882v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-3-x:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +6 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-3-x.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-3-x.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] +3 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-3/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@kms_fbcon_fbt@fbc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc.html
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_fbcon_fbt@fbc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-464/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] +67 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [PASS][11] -> [SKIP][12] +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:
    - shard-bmg:          [PASS][14] -> [FAIL][15] +33 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-hang@pipe-d-dp-2}:
    - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] +9 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-2/igt@kms_async_flips@async-flip-hang@pipe-d-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@kms_async_flips@async-flip-hang@pipe-d-dp-2.html

  * {igt@xe_compute_preempt@compute-preempt-many-vram}:
    - shard-bmg:          [PASS][20] -> [INCOMPLETE][21] +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * {igt@xe_pmu@engine-activity-suspend}:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-434/igt@xe_pmu@engine-activity-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-434/igt@xe_pmu@engine-activity-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-152882v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#4677]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-dp-2:
    - shard-bmg:          [PASS][26] -> [FAIL][27] ([Intel XE#3884]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-dp-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#4626]) +8 other tests dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3279])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#607])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#4543]) +7 other tests dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#316]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1124])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1124]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#607])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1428])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1124]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#367]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#787]) +146 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][46] -> [INCOMPLETE][47] ([Intel XE#3862]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#3862]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2887]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#787]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4417]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#306])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#373])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#373]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-bmg:          NOTRUN -> [ABORT][61] ([Intel XE#5826])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][62] ([Intel XE#5898])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][63] ([Intel XE#5826])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3278])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#307])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#3304])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#1188])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2320]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1424])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2321])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#309])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2291]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#309]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#323])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1508])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#4354])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2244])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#2316]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1421]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][86] -> [DMESG-WARN][87] ([Intel XE#4543]) +13 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#301]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#301] / [Intel XE#3149])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#5208])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][94] -> [INCOMPLETE][95] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293] / [Intel XE#2380])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1397])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401] / [Intel XE#1745])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2311]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#651]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#651]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#651]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#656]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#5390]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#656]) +12 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#653]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2313]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-adlp:         [PASS][112] -> [DMESG-WARN][113] ([Intel XE#2953] / [Intel XE#4173])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-1/igt@kms_getfb@getfb-handle-closed.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-6/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#3374] / [Intel XE#3544])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][115] -> [SKIP][116] ([Intel XE#1503])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#3012])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][119] ([Intel XE#4658]) +3 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2763]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2938])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1439] / [Intel XE#3141])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#836])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1489] / [Intel XE#5899])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406] / [Intel XE#5899]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][131] ([Intel XE#1874])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][132] ([Intel XE#4689])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3414])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1435])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1499])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4837]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4837]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#4837] / [Intel XE#5565])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4837]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#688])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#261] / [Intel XE#5564])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2322]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][146] -> [SKIP][147] ([Intel XE#1392]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#288]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][152] -> [DMESG-WARN][153] ([Intel XE#3876])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4915]) +50 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#4915]) +36 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4943]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#4943]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - shard-adlp:         [PASS][158] -> [DMESG-FAIL][159] ([Intel XE#3876])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2459] / [Intel XE#2596])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#1008] / [Intel XE#5591])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186]) -> ([PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [SKIP][211], [PASS][212]) ([Intel XE#378])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#5103])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@polling:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#3573])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_oa@polling.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#1061])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][216] ([Intel XE#1173]) +1 other test fail
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#2284] / [Intel XE#366])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#2284])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#584])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#944]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#944])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][222] ([Intel XE#4543]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][224] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][226] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-dg2-set2:     [ABORT][228] ([Intel XE#5826]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-436/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_concurrent@multi-plane-atomic-lowres.html
    - shard-lnl:          [ABORT][230] ([Intel XE#5826]) -> [PASS][231] +1 other test pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][232] ([Intel XE#5826] / [Intel XE#5898]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-436/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-adlp:         [ABORT][234] ([Intel XE#5826]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-4/igt@kms_cursor_crc@cursor-random-256x85.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][236] ([Intel XE#2291]) -> [PASS][237] +5 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][238] ([Intel XE#4302]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][240] ([Intel XE#2316]) -> [PASS][241] +7 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][242] ([Intel XE#301]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#4543]) -> [PASS][245] +7 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][246] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][247] +4 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1392]) -> [PASS][249] +5 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][250] ([Intel XE#4543]) -> [FAIL][251] ([Intel XE#1874])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-lnl:          [ABORT][252] -> [SKIP][253] ([Intel XE#373])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][254] ([Intel XE#1178]) -> [SKIP][255] ([Intel XE#2341])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_content_protection@srm.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][256] ([Intel XE#2341]) -> [FAIL][257] ([Intel XE#1188])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_content_protection@uevent.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [ABORT][258] ([Intel XE#4847]) -> [ABORT][259] ([Intel XE#4847] / [Intel XE#5545])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][260] ([Intel XE#301]) -> [FAIL][261] ([Intel XE#301] / [Intel XE#3149])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][262] ([Intel XE#2312]) -> [SKIP][263] ([Intel XE#2311]) +15 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][264] ([Intel XE#2311]) -> [SKIP][265] ([Intel XE#2312]) +9 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][266] ([Intel XE#2312]) -> [SKIP][267] ([Intel XE#5390]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][268] ([Intel XE#5390]) -> [SKIP][269] ([Intel XE#2312]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#2312]) -> [SKIP][271] ([Intel XE#2313]) +15 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][272] ([Intel XE#2313]) -> [SKIP][273] ([Intel XE#2312]) +10 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][274] ([Intel XE#5021]) -> [SKIP][275] ([Intel XE#4596])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][276] ([Intel XE#2509]) -> [SKIP][277] ([Intel XE#2426])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][278] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][279] ([Intel XE#5466])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5898
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13 -> xe-pw-152882v1

  IGT_8493: 8493
  xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13: 546fc742f08b8dbd3fa1486933c9b15085e11d13
  xe-pw-152882v1: 152882v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/index.html

--===============7796496477154132708==
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
<tr><td><b>Series:</b></td><td>Driver-managed exhaustive eviction</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152882/">https://patchwork.freedesktop.org/series/152882/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152882v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152882v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3539-546fc742f08b8dbd3fa1486933c9b1508=
5e11d13_FULL -&gt; xe-pw-152882v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152882v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152882v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1528=
82v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d=
-hdmi-a-3-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-3-x.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152882v1/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events=
-tiled-atomic@pipe-d-hdmi-a-3-x.html">DMESG-WARN</a> +6 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-3/igt@kms_async_flip=
s@crc-atomic@pipe-c-dp-2.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@kms_fbc=
on_fbt@fbc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc.html">FAIL</a><=
/li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_fb=
con_fbt@fbc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152882v1/shard-dg2-464/igt@kms_fbcon_fbt@fbc.html">FAIL</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html=
">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-1p-rte.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-8/igt@kms_frontbuffer=
_tracking@fbc-1p-rte.html">SKIP</a> +11 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
c-1p-rte.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-2/igt@sriov_ba=
sic@enable-vfs-autoprobe-off@numvfs-7.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@sriov_b=
asic@enable-vfs-autoprobe-off@numvfs-7.html">FAIL</a> +33 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-bindexecqueue-userptr-rebind-imm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolati=
on.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-hang@pipe-d-dp-2}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-2/igt@kms_asyn=
c_flips@async-flip-hang@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@kms_async=
_flips@async-flip-hang@pipe-d-dp-2.html">DMESG-WARN</a> +9 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_compute_preempt@compute-preempt-many-vram}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@xe_compu=
te_preempt@compute-preempt-many-vram.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-1/igt@xe_compu=
te_preempt@compute-preempt-many-vram.html">INCOMPLETE</a> +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@engine-activity-suspend}:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-434/igt@xe_pmu=
@engine-activity-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-434/igt@xe_pmu@engine-acti=
vity-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152882v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-3/igt@kms_async_=
flips@crc-atomic@pipe-d-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4677">Intel XE#4677</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_asyn=
c_flips@crc@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-8/igt@kms_async_flips@crc@p=
ipe-d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-8/igt@kms_async_flips@c=
rc@pipe-d-hdmi-a-3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) +8 other tests dmesg-=
fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_big=
_fb@y-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_big_fb@y-tile=
d-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests dmesg-fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@y-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-5/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-433/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_chamelium_edid@dp-mode-t=
imings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-a=
spect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-at=
omic-lowres.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5826">Intel XE#5826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-at=
omic-lowres@pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5898">Intel XE#5898</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_concurrent@multi-plane-at=
omic-lowres@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-434/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-1/igt@kms_fli=
p@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-6/i=
gt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152882v1/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152882v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-closed:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-1/igt@kms_get=
fb@getfb-handle-closed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-6/igt@kms_getfb@getfb-handl=
e-closed.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-8/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_plane_multiple@tiling-x@p=
ipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5899">Intel XE#5899</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_psr@psr2-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5899">Intel XE#5899</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-=
rotation-cropping-top.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inpla=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_create@multigpu-create-m=
assive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-di=
scovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_eudebug_online@interrupt-=
all-set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@xe_evict@evict-beng-small-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@xe_evict@evict-large-externa=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15288=
2v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-=
basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_exec_fault_mode@invalid-=
va.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_fault_mode@twice-use=
rptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_exec_system_allocator@ma=
ny-large-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +50 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_exec_system_allocator@onc=
e-malloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@xe_exec=
_threads@threads-bal-shared-vm-userptr.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@xe_ex=
ec_threads@threads-bal-shared-vm-userptr.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e1=
1d13/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b150=
85e11d13/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9=
b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa14869=
33c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1=
486933c9b15085e11d13/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd=
3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742f08b=
8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546fc742=
f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-546f=
c742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3539-=
546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152882v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-lnl-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-432/igt@xe_oa@mmio-triggered-report=
s-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5103">Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_oa@polling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-lnl-1/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152882v1/shard-adlp-9/igt@xe_query@multigpu-query-pxp-=
status.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152882v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152882v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2=
-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-436/igt@kms_co=
ncurrent@multi-plane-atomic-lowres.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-dg2-4=
35/igt@kms_concurrent@multi-plane-atomic-lowres.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-5/igt@kms_conc=
urrent@multi-plane-atomic-lowres.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-4/i=
gt@kms_concurrent@multi-plane-atomic-lowres.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-436/igt@kms_co=
ncurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5898"=
>Intel XE#5898</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152882v1/shard-dg2-435/igt@kms_concurrent@multi-plane-atomic-lowr=
es@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-random-256x85.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5826">Intel XE#5826</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-4/igt@=
kms_cursor_crc@cursor-random-256x85.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152882v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-3/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shar=
d-adlp-3/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> +7 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-8/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152882v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pip=
e-a-hdmi-a-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-=
dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52882v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-=
hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-1/igt@kms_cham=
elium_edid@hdmi-edid-change-during-hibernate.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/ig=
t@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#37=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-7/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-adlp-2/igt@kms_fbc=
on_fbt@fbc-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4847">Intel XE#4847</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-adlp-1/igt@kms_fbcon_=
fbt@fbc-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4847">Intel XE#4847</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-lnl-2/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152882v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152882v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1528=
82v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
882v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152882v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v1/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13/shard-lnl-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152882v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13 -&gt; xe-pw-152=
882v1</li>
</ul>
<p>IGT_8493: 8493<br />
  xe-3539-546fc742f08b8dbd3fa1486933c9b15085e11d13: 546fc742f08b8dbd3fa1486=
933c9b15085e11d13<br />
  xe-pw-152882v1: 152882v1</p>

</body>
</html>

--===============7796496477154132708==--
