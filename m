Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDFEC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07B10E4CE;
	Thu,  3 Sep 2026 17:40:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EF610E4CE;
 Thu,  3 Sep 2026 17:40:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5754461705881251116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Compress_GuC?=
 =?utf-8?q?_log_and_CTB_dump_with_zstd_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 17:40:37 -0000
Message-ID: <178845723774.119026.15436961504136850695@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

--===============5754461705881251116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev4)
URL   : https://patchwork.freedesktop.org/series/170589/
State : failure

== Summary ==

CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_FULL -> xe-pw-170589v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170589v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170589v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170589v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-5/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html

  
New tests
---------

  New tests have been introduced between xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_FULL and xe-pw-170589v4_FULL:

### New IGT tests (82) ###

  * igt@kms_cursor_crc@cursor-offscreen-128x128:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.37] s

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [5.34, 6.52] s

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.91] s

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.55] s

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.20] s

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.84] s

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [5.81, 7.73] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.80] s

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [9.50, 11.87] s

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.77] s

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.02] s

  * igt@kms_cursor_crc@cursor-random-128x42:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-random-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [9.51, 12.29] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.84] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_cursor_crc@cursor-random-256x85:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-random-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_cursor_crc@cursor-random-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_cursor_crc@cursor-random-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-random-64x21:
    - Statuses : 2 skip(s)
    - Exec time: [0.06, 0.07] s

  * igt@kms_cursor_crc@cursor-random-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [11.67] s

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.92] s

  * igt@kms_cursor_crc@cursor-random-max-size:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.09] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 2.10] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.23, 2.06] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.15] s

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.19] s

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [9.35, 11.89] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.20] s

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_cursor@overlay:
    - Statuses : 1 pass(s)
    - Exec time: [34.15] s

  * igt@kms_plane_cursor@primary:
    - Statuses : 2 pass(s)
    - Exec time: [34.38, 36.81] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.95] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  * igt@kms_plane_cursor@viewport:
    - Statuses : 1 pass(s)
    - Exec time: [35.42] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  

Known issues
------------

  Here are the changes found in xe-pw-170589v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652]) +8 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#4416] / [Intel XE#7381]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2325] / [Intel XE#7358])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-lnl:          [PASS][16] -> [SKIP][17] ([Intel XE#3297])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_color@ctm-red-to-blue.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-lnl:          [PASS][18] -> [SKIP][19] ([Intel XE#7006]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6969]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-1.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#6969] / [Intel XE#7006])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42 (NEW):
    - shard-lnl:          [SKIP][24] ([Intel XE#1424]) -> [SKIP][25] ([Intel XE#9125]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170 (NEW):
    - shard-lnl:          [SKIP][26] ([Intel XE#9125]) -> [SKIP][27] ([Intel XE#2321] / [Intel XE#7355])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-64x21 (NEW):
    - shard-lnl:          [SKIP][29] ([Intel XE#9125]) -> [SKIP][30] ([Intel XE#1424]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - shard-lnl:          [PASS][31] -> [SKIP][32] ([Intel XE#9125]) +44 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_cursor_crc@cursor-tearing-position-change.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8265]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4422] / [Intel XE#7442])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [PASS][35] -> [SKIP][36] ([Intel XE#9127])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_fbcon_fbt@fbc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4156] / [Intel XE#7425])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#8680])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [PASS][39] -> [SKIP][40] ([Intel XE#1135])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_feature_discovery@psr1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [PASS][41] -> [SKIP][42] ([Intel XE#9132])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_flip@flip-vs-dpms-on-nop.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3321]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#301])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2597] / [Intel XE#8488]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#2482]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7178] / [Intel XE#7349])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7061]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4141]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +28 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [PASS][57] -> [SKIP][58] ([Intel XE#7779])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-lnl:          [PASS][59] -> [SKIP][60] ([Intel XE#2548] / [Intel XE#7779]) +15 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +34 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#7308])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][64] -> [SKIP][65] ([Intel XE#2568]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_invalid_mode@uint-max-clock.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6901])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4298] / [Intel XE#5873])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2486])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8303]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-lnl:          [PASS][70] -> [SKIP][71] ([Intel XE#7250] / [Intel XE#9128]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7283])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#5021] / [Intel XE#7377])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-lnl:          [PASS][74] -> [SKIP][75] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#8399])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2505] / [Intel XE#7447])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6814] / [Intel XE#7428])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][83] -> [SKIP][84] ([Intel XE#4886])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4608])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4608] / [Intel XE#7304])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [PASS][87] -> [SKIP][88] ([Intel XE#1489]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1489]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2387] / [Intel XE#7429])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [PASS][93] -> [SKIP][94] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_psr@psr2-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][95] -> [SKIP][96] ([Intel XE#7795])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2330] / [Intel XE#5813])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2413])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7638])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#7992]) +26 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][101] -> [INCOMPLETE][102] ([Intel XE#8602])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-5/igt@xe_ccs@suspend-resume.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_ccs@suspend-resume.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][103] -> [INCOMPLETE][104] ([Intel XE#6321] / [Intel XE#8355])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#8578])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-1/igt@xe_exec_fault_mode@atomic-many.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#8374]) +10 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#8364]) +10 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][110] ([Intel XE#9130])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][111] ([Intel XE#8652])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-bmg:          [PASS][112] -> [INCOMPLETE][113] ([Intel XE#9041])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-3/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#8369])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#8378]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][116] -> [ABORT][117] ([Intel XE#8007])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#6964]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7793]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2245] / [Intel XE#7590])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][121] ([Intel XE#7695])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4733] / [Intel XE#7417])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#944])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][125] -> [FAIL][126] ([Intel XE#6569]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-bmg:          [PASS][127] -> [FAIL][128] ([Intel XE#7992])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-2/igt@xe_sriov_vram@vf-access-after-resize-down.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-lnl:          [SKIP][129] ([Intel XE#2134]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@fbdev@info.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@fbdev@info.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [SKIP][131] ([Intel XE#3297]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_color@ctm-signed.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_color@ctm-signed.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-lnl:          [SKIP][133] -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][135] ([Intel XE#301]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][137] ([Intel XE#2482]) -> [PASS][138] +6 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-lnl:          [SKIP][139] ([Intel XE#1745]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][141] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][142] +15 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][143] ([Intel XE#7779]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][145] ([Intel XE#2568]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][147] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][148] +3 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][149] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687]) -> [PASS][150] +3 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [SKIP][151] ([Intel XE#870]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [SKIP][153] ([Intel XE#7760]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][155] ([Intel XE#8399]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-lnl:          [SKIP][157] ([Intel XE#6927] / [Intel XE#8854]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [SKIP][159] ([Intel XE#4886]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-lnl:          [SKIP][161] ([Intel XE#9129]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_properties@crtc-properties-atomic.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-lnl:          [SKIP][163] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][165] ([Intel XE#9125]) -> [PASS][166] +48 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_vblank@query-forked.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_vblank@query-forked.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [ABORT][167] ([Intel XE#8007]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-3/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][169] ([Intel XE#6569]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][171] ([Intel XE#9125]) -> [SKIP][172] ([Intel XE#3279])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][173] ([Intel XE#1407]) -> [SKIP][174] ([Intel XE#9125]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][175] ([Intel XE#9125]) -> [SKIP][176] ([Intel XE#1407]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][177] ([Intel XE#9125]) -> [SKIP][178] ([Intel XE#1124]) +10 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][179] ([Intel XE#1477] / [Intel XE#7361]) -> [SKIP][180] ([Intel XE#9125])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][181] ([Intel XE#1124]) -> [SKIP][182] ([Intel XE#9125]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][183] ([Intel XE#9125]) -> [SKIP][184] ([Intel XE#1477] / [Intel XE#7361])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][185] ([Intel XE#9125]) -> [SKIP][186] ([Intel XE#7679]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][187] ([Intel XE#8365]) -> [SKIP][188] ([Intel XE#9125]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][189] ([Intel XE#367]) -> [SKIP][190] ([Intel XE#9125])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][191] ([Intel XE#9125]) -> [SKIP][192] ([Intel XE#8365])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][193] ([Intel XE#9125]) -> [SKIP][194] ([Intel XE#2887]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][195] ([Intel XE#9125]) -> [SKIP][196] ([Intel XE#2669] / [Intel XE#7389])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][197] ([Intel XE#9125]) -> [SKIP][198] ([Intel XE#3432]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][199] ([Intel XE#3432]) -> [SKIP][200] ([Intel XE#9125])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][201] ([Intel XE#2887]) -> [SKIP][202] ([Intel XE#9125]) +11 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][203] ([Intel XE#7008]) -> [SKIP][204] ([Intel XE#9125])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][205] ([Intel XE#9125]) -> [SKIP][206] ([Intel XE#4416] / [Intel XE#7381])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cdclk@plane-scaling.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][207] ([Intel XE#7006]) -> [SKIP][208] ([Intel XE#6969] / [Intel XE#7006])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-lnl:          [SKIP][209] ([Intel XE#9125]) -> [SKIP][210] ([Intel XE#7642])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][211] ([Intel XE#9125]) -> [SKIP][212] ([Intel XE#307] / [Intel XE#6974])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][213] ([Intel XE#7642]) -> [SKIP][214] ([Intel XE#9125]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_content_protection@uevent.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][215] ([Intel XE#9125]) -> [SKIP][216] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          [SKIP][217] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][218] ([Intel XE#9125]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][219] ([Intel XE#9125]) -> [SKIP][220] ([Intel XE#4354] / [Intel XE#5882])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][221] ([Intel XE#9125]) -> [SKIP][222] ([Intel XE#4354] / [Intel XE#7450])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][223] ([Intel XE#9009]) -> [SKIP][224] ([Intel XE#9125])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][225] ([Intel XE#8265]) -> [SKIP][226] ([Intel XE#9125]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-lnl:          [SKIP][227] ([Intel XE#9125]) -> [SKIP][228] ([Intel XE#8265]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          [SKIP][229] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][230] ([Intel XE#9125])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][231] ([Intel XE#9125]) -> [SKIP][232] ([Intel XE#4422] / [Intel XE#7442])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][233] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) -> [SKIP][234] ([Intel XE#1745]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          [SKIP][235] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][236] ([Intel XE#6312] / [Intel XE#651]) +8 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][237] ([Intel XE#2311]) -> [INCOMPLETE][238] ([Intel XE#6819])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][239] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][240] ([Intel XE#7779]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][241] ([Intel XE#1469] / [Intel XE#7399]) -> [SKIP][242] ([Intel XE#2548] / [Intel XE#7779])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][243] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][244] ([Intel XE#656] / [Intel XE#7905]) +28 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][245] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][246] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][247] ([Intel XE#7779]) -> [SKIP][248] ([Intel XE#6312]) +10 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:
    - shard-lnl:          [SKIP][249] ([Intel XE#6312]) -> [SKIP][250] ([Intel XE#7779]) +9 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][251] ([Intel XE#7779]) -> [SKIP][252] ([Intel XE#7399])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][253] ([Intel XE#7779]) -> [SKIP][254] ([Intel XE#7865]) +18 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][255] ([Intel XE#7779]) -> [SKIP][256] ([Intel XE#7905]) +39 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][257] ([Intel XE#7865]) -> [SKIP][258] ([Intel XE#7779]) +21 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][259] ([Intel XE#7905]) -> [SKIP][260] ([Intel XE#7779]) +39 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][261] ([Intel XE#7779]) -> [SKIP][262] ([Intel XE#7061]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][263] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][264] ([Intel XE#2548] / [Intel XE#7779]) +30 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][265] ([Intel XE#7779]) -> [SKIP][266] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][267] ([Intel XE#7061]) -> [SKIP][268] ([Intel XE#7779]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][269] ([Intel XE#1503]) -> [SKIP][270] ([Intel XE#9125]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_hdr@static-toggle.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][271] ([Intel XE#9125]) -> [SKIP][272] ([Intel XE#6912] / [Intel XE#7375])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][273] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][274] ([Intel XE#9125])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-lnl:          [SKIP][275] ([Intel XE#7250]) -> [SKIP][276] ([Intel XE#7250] / [Intel XE#9128])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][277] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][278] ([Intel XE#9125])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][279] ([Intel XE#9125]) -> [SKIP][280] ([Intel XE#4596] / [Intel XE#5854])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][281] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][282] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][283] ([Intel XE#3307]) -> [SKIP][284] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][285] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687]) -> [SKIP][286] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][287] ([Intel XE#1489]) -> [SKIP][288] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][289] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][290] ([Intel XE#1489])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][291] ([Intel XE#1489]) -> [SKIP][292] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][293] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][294] ([Intel XE#1489]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][295] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][296] ([Intel XE#1128] / [Intel XE#7413]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          [SKIP][297] ([Intel XE#1406]) -> [SKIP][298] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          [SKIP][299] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][300] ([Intel XE#1406] / [Intel XE#7345]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][301] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][302] ([Intel XE#1406]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][303] ([Intel XE#9125]) -> [SKIP][304] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][305] ([Intel XE#9125]) -> [SKIP][306] ([Intel XE#1127] / [Intel XE#5813])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][307] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][308] ([Intel XE#9125])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          [SKIP][309] ([Intel XE#9125]) -> [SKIP][310] ([Intel XE#1499])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_vrr@lobf.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-lnl:          [SKIP][311] ([Intel XE#8397]) -> [SKIP][312] ([Intel XE#9125])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_vrr@lobf-dc3co.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_vrr@lobf-dc3co.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [ABORT][313] ([Intel XE#8868]) -> [FAIL][314] ([Intel XE#7992])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][315] ([Intel XE#8963]) -> [ABORT][316] ([Intel XE#8591] / [Intel XE#8963])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-8/igt@xe_wedged@basic-wedged.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8602
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9080 -> IGT_9081
  * Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -> xe-pw-170589v4

  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9081: 9081
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8fbc67822b4cf848c3
  xe-pw-170589v4: 170589v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/index.html

--===============5754461705881251116==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Compress GuC log and CTB dump wi=
th zstd (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170589/">https://patchwork.freedesktop.org/series/170589/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-170589v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-170589v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4=
cf848c3_FULL -&gt; xe-pw-170589v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170589v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-170589v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1705=
89v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-5/igt@xe_ccs@s=
uspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-=
bmg-5/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5680-bb742c97086d95b2a04b1b8fb=
c67822b4cf848c3_FULL and xe-pw-170589v4_FULL:</p>
<h3>New IGT tests (82)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.34, 6.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.81, 7.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.50, 11.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.51, 12.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.23, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.35, 11.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [34.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [34.38, 36.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [35.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170589v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_bw@linear-tiling-4-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe-=
b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_colo=
r@ctm-red-to-blue.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_color@ctm-red-to-blue.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_colo=
r_pipeline@plane-lut1d-ctm3x4-lut1d.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_color=
_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-a-plane-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-c-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42 (NEW):</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170 (NEW):</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7=
355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21 (NEW):</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_curs=
or_crc@cursor-tearing-position-change.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_cur=
sor_crc@cursor-tearing-position-change.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +44 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_fbco=
n_fbt@fbc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel X=
E#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">I=
ntel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_feat=
ure_discovery@psr1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_flip=
@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on=
-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_flip@flip-vs-expi=
red-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2597">Intel XE#2597</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8488">Intel XE#8488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shar=
d-lnl-6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2482">Intel XE#2482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard=
-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/i=
gt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel =
XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-10/igt@kms_hdm=
i_inject@inject-audio.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_hdmi_inject@inject-=
audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_inva=
lid_mode@uint-max-clock.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_invalid_mode@uint=
-max-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_plan=
e@pixel-format-4-tiled-lnl-ccs-modifier.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_p=
lane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE=
#9128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shar=
d-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_plan=
e_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/ig=
t@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
6">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
4">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_pm_r=
pm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_pm_rpm@universal=
-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-l=
nl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane=
-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_psr@=
psr2-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr@psr2-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7638">Intel XE#7638</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@sriov_basic@enable-vfs-autopr=
obe-off@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-5/igt@xe_ccs@s=
uspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_ccs@suspend-resume.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8602">Intel XE#8602</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#73=
72</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-1/igt@xe_exec_=
fault_mode@atomic-many.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_exec_fault_mode@ato=
mic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset=
-concurrent-submit-sync.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-3/igt@xe_exec_=
reset@gt-stress-reset-mixed-engine-usage.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/igt@xe_e=
xec_reset@gt-stress-reset-mixed-engine-usage.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041">Intel XE#9041=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_exec_reset@multi-queue-clo=
se-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-9/igt@xe_fault=
_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-4/ig=
t@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel X=
E#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherenc=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_page_reclaim@boundary-spl=
it.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compar=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-2/igt@xe_sriov=
_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6569">Intel XE#6569</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-2/igt@xe_sriov=
_vram@vf-access-after-resize-down.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_sriov_vr=
am@vf-access-after-resize-down.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@fbdev@info.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_colo=
r@ctm-signed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_color@ctm-sign=
ed.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fb_c=
oherency@memset-crc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_fb_coherency@memset-c=
rc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_flip=
@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/ig=
t@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +6 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
0589v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-=
upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-pri-shrfb-draw-blt.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-s=
hrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_inva=
lid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_inv=
alid_mode@clock-too-high.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7687">Intel XE#7687</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_plane_scaling@p=
lane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> +3 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_pm_=
backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@k=
ms_pm_backlight@brightness-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl=
-7/igt@kms_pm_dc@dc5-pageflip-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pm_r=
pm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/igt@kms_pm_rp=
m@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_prop=
erties@crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@k=
ms_properties@crtc-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@=
fbc-psr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl=
-1/igt@kms_psr@fbc-psr-cursor-plane-move.html">PASS</a> +3 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_vbla=
nk@query-forked.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/igt@kms_vblank@quer=
y-forked.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-3/igt@xe_confi=
gfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-2/ig=
t@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-4/igt@xe_sriov=
_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-6/igt@xe_sriov_flr@flr=
-twice.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fen=
cing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_big_=
fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms=
_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4=
/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms=
_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-ln=
l-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1=
477</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
61">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_bw@l=
inear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-l=
nl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_bw@l=
inear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard=
-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Inte=
l XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-=
lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel =
XE#2669</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7389">Intel XE#7389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard=
-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-=
lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shar=
d-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-4/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/i=
gt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel =
XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cont=
ent_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/i=
gt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel =
XE#7343</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/s=
hard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-4/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_dsc@dsc-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-8=
/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel =
XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v4/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-=
tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4=
/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7385">Intel XE#7385</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_flip_scaled_crc@fl=
ip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312=
">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-170589v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-=
indfb-draw-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#=
7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/sha=
rd-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel =
XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) =
+28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-170589v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-i=
ndfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6312">Intel XE#6312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/=
shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7779">Intel XE#7779</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-=
2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7865">Intel XE#7865</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
70589v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7905">Intel XE#7905</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Int=
el XE#7865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscr=
een-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +21 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#=
7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4=
/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">I=
ntel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-170589v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-i=
ndfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +30 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard=
-lnl-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Inte=
l XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_hdr@static-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-2/ig=
t@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#=
7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel =
XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v4/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plan=
e@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/ig=
t@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#=
9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-2/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-l=
nl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-1/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shar=
d-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687"=
>Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-8/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@km=
s_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7687">Intel XE#7687</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_plane_scaling@pl=
ane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-l=
nl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-5/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/sha=
rd-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-ln=
l-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7=
413</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-7/igt@kms_psr@=
fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_p=
sr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@=
fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-5/ig=
t@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_psr@=
pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-7/igt@kms_=
psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-ln=
l-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-l=
nl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE=
#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#39=
04</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734=
2">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-refl=
ect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-6/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-170589v4/shard-lnl-3/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-lnl-3/igt@kms_vrr@=
lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8397">Intel XE#8397</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-lnl-6/igt@kms_vrr@lobf-dc3co.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-7/igt@sriov_ba=
sic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-9/igt@s=
riov_basic@pf-unbind-with-vf-probed.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/shard-bmg-8/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/shard-bmg-5/igt@xe_wedged@=
basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8591">Intel XE#8591</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9080 -&gt; IGT_9081</li>
<li>Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -&gt; xe-pw-170=
589v4</li>
</ul>
<p>IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9081: 9081<br />
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8=
fbc67822b4cf848c3<br />
  xe-pw-170589v4: 170589v4</p>

</body>
</html>

--===============5754461705881251116==--
